#!/bin/bash

LOG_FILE="/home/vcavallo/vaporware-blog/log/webhook.log"

echo "Webhook received at $(date)" >> "$LOG_FILE"

# Read the request payload from stdin
payload=$(cat)
echo "Webhook payload: $payload" >> "$LOG_FILE"

# Extract the ref from the payload
ref=$(echo "$payload" | grep -oP '"ref":.*?[^\\]"' | cut -d '"' -f 4)
echo "Ref: $ref" >> "$LOG_FILE"

# Check if the ref matches the desired branch (e.g., 'refs/heads/master')
if [[ $ref == "refs/heads/master" ]]; then
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
