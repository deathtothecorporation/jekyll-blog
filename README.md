# Vaporware Jekyll Blog

# GUI editor

- Be added to the Netlify identity system
- Go to [https://vaporware-blog.netlify.app/admin](https://vaporware-blog.netlify.app/admin)

- Ruby 3.*
- `bundle install`
- `bundle exec jekyll serve`

## Hosting

- install Go (ugh)
- install Caddy with custom build to support `exec`: [xcaddy](https://github.com/caddyserver/xcaddy) [caddy-exec](https://github.com/abiosoft/caddy-exec)
- use the binary built from above for running caddy (see systemd service later)

### Caddyfile

`/etc/caddy/Caddyfile`:

```
blog.vaporware.network {
    root * /home/vcavallo/vaporware-blog/_site
    encode zstd gzip
    file_server

    route /webhook {
      exec {
        comand /home/vcavallo/vaporware-blog/sh/github-webhook.sh
      }
    }
}
```

### Git webhook and post-receive

#### post-receive

The `/webhook` endpoint above receives pings when the `master` branch receives updates.  
It then calls the `sh/github-webhook.sh` script, which checks the branch and then calls the `post-receive` hook (which you must create. see below)

```
# .git/hook/post-receive

#!/bin/bash

# Navigate to the repository directory
cd /home/vcavallo/vaporware-blog

# Pull the latest changes from the remote repository
if ! git pull; then
  echo "Error: Failed to pull latest changes from the remote repository."
  exit 1
fi

# build site and capture output
# Make sure to use proper bundle path
jekyll_output=$(/home/vcavallo/.rbenv/shims/bundle exec jekyll build 2>&1)

# Check if the jekyll build command succeeded
if [ $? -ne 0 ]; then
  echo "Error: Jekyll build failed."
  echo "Jekyll build output:"
  echo "$jekyll_output"
  exit 1
fi

echo "Jekyll build completed successfully."
```

#### GitHub webhook

- Create a new webhook in the repository: `Settings > Webhooks`
  - payload URL: `https://blog.vaporware.network/webhook`
  - content type: `application/json`
  - secret: [leave blank]
  - SSL: enable
  - Which events? "Just the `push` event"
  - Active: checked


### Systemd service for caddy:

`/etc/systemd/system/caddy.service` (`ExecStart` and `ExecReload` reflect the binary built above)

```
[Unit]
Description=Caddy Web Server
Documentation=https://caddyserver.com/docs/
After=network.target

[Service]
User=vcavallo
Group=vcavallo
ExecStart=/home/vcavallo/caddy/bin/caddy run --environ --config /etc/caddy/Caddyfile
ExecReload=/home/vcavallo/caddy/bin/caddy reload --config /etc/caddy/Caddyfile
TimeoutStopSec=5s
LimitNOFILE=1048576
LimitNPROC=512
PrivateTmp=true
ProtectSystem=full
AmbientCapabilities=CAP_NET_BIND_SERVICE

[Install]
WantedBy=multi-user.target
```
