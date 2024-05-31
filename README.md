# Vaporware Jekyll Blog

- Ruby 3.*
- `bundle install`
- `bundle exec jekyll serve`

Visit `/admin` for the editing GUI.

## Hosting

- `bundle exec jekyll serve --host 0.0.0.0`

`/etc/caddy/Caddyfile`:

```
blog.vaporware.network {
    reverse_proxy localhost:4000
    basicauth /admin/* {
        Username <hashed-password>
    }
    basicauth /_api/* {
        Username <hashed-password>
    }
}
```

`/etc/systemd/system/caddy.service`:

```
[Unit]
Description=Caddy Web Server
Documentation=https://caddyserver.com/docs/
After=network.target

[Service]
User=caddy
Group=caddy
ExecStart=/usr/bin/caddy run --environ --config /etc/caddy/Caddyfile
ExecReload=/usr/bin/caddy reload --config /etc/caddy/Caddyfile
TimeoutStopSec=5s
LimitNOFILE=1048576
LimitNPROC=512
PrivateTmp=true
ProtectSystem=full
AmbientCapabilities=CAP_NET_BIND_SERVICE

[Install]
WantedBy=multi-user.target
```

`/etc/systemd/system/start-blog.service`:

```
[Unit]
Description=blog.vaporware.network
Requires=network.target

[Service]
Type=simple
User=vcavallo
Group=vcavallo
WorkingDirectory=/home/vcavallo/vaporware-blog
ExecStart=/home/vcavallo/.rbenv/versions/3.1.2/bin/jekyll serve --verbose --host 0.0.0.0
TimeoutSec=30
RestartSec=15s
Restart=always

Environment=GEM_HOME=/home/vcavallo/.rbenv/versions/3.1.2/lib/ruby/gems
Environment=PATH=/home/vcavallo/.rbenv/versions/3.1.2/bin:$PATH

[Install]
WantedBy=multi-user.target
```

