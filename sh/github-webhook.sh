#!/bin/bash

echo "Got a github webhook"
# Read the request payload from stdin
payload=$(cat)

# Extract the ref from the payload
ref=$(echo "$payload" | grep -oP '"ref":.*?[^\\]"' | cut -d '"' -f 4)
echo "Got a the payload"

# Check if the ref matches the desired branch (e.g., 'refs/heads/master')
if [[ $ref == "refs/heads/master" ]]; then
    echo "Master branch..."
    # Navigate to the repository directory
    cd /home/vcavallo/vaporware-blog

    echo "Running post-receive..."
    # Execute the post-receive hook
    .git/hooks/post-receive
    echo "Ran post-receive"
fi
echo "Done!"
