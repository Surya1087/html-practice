#!/bin/bash

REPO_DIR="/Users/suryapratapsingh/Desktop/DEVELOPMENT"
LOG_FILE="$REPO_DIR/git_auto.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

cd "$REPO_DIR" || { echo "$TIMESTAMP - Failed to cd to $REPO_DIR" >> "$LOG_FILE"; exit 1; }

# Check for changes
if [[ -n $(git status --porcelain) ]]; then
    /usr/bin/git add .
    /usr/bin/git commit -m "Auto commit"
    /usr/bin/git push origin main >> "$LOG_FILE" 2>&1
    echo "$TIMESTAMP - Changes committed and pushed" >> "$LOG_FILE"
else
    echo "$TIMESTAMP - No changes to commit" >> "$LOG_FILE"
fi
