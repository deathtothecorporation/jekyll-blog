#!/bin/bash

LOG_FILE="/home/vcavallo/vaporware-blog/log/webhook.log"

echo "Webhook received at $(date)" >> "$LOG_FILE"

# Read the request payload from stdin
echo "Raw request body: $(cat)" >> "$LOG_FILE"
payload="$1"
echo "Webhook payload: $payload" >> "$LOG_FILE"

# Extract the ref from the payload
ref=$(echo "$payload" | grep -oP '"ref":.*?[^\\]"' | cut -d '"' -f 4)
echo "Ref: $ref" >> "$LOG_FILE"
# Since caddy-exec doesn't include placeholders like request body,
# we need to just _always_ run this :(
ref=1

# Check if the ref matches the desired branch (e.g., 'refs/heads/master')
if [[ $ref == 1 ]]; then
    echo "Updating master branch" >> "$LOG_FILE"
    # Navigate to the repository directory
    cd /home/vcavallo/vaporware-blog

    # Execute the post-receive hook
     git pull >> "$LOG_FILE" 2>&1
    .git/hooks/post-receive >> "$LOG_FILE" 2>&1
else
    echo "Ignoring push event for non-master branch" >> "$LOG_FILE"
fi
echo "Done! $(date) " >> "$LOG_FILE"
