#!/bin/bash

# Define the input file
REPO_FILE="repos.txt"

# Ensure the file exists
if [[ ! -f "$REPO_FILE" ]]; then
    echo "Error: $REPO_FILE not found!"
    exit 1
fi

# Read each line from the text file
while read -r FROM_REPO TO_REPO; do
    # Skip empty lines
    [[ -z "$FROM_REPO" || -z "$TO_REPO" ]] && continue

    # Extract repo name from SSH URL (remove `.git` at the end)
    REPO_NAME=$(basename "$FROM_REPO" .git)

    echo "🚀 Migrating repository: $REPO_NAME"

    # Clone the repository using --mirror to retain branches and tags
    git clone --mirror "$FROM_REPO" "$REPO_NAME"

    # Navigate into the cloned repository
    cd "$REPO_NAME" || exit

    # Set the new remote to GitLab
    git remote set-url origin "$TO_REPO"

    # Push everything to the new repository
    git push --mirror origin

    # Move back to the original directory and remove the cloned repo
    cd ..
    rm -rf "$REPO_NAME"

    echo "✅ Migration for $REPO_NAME completed successfully!"
done < "$REPO_FILE"

echo "🎉 All migrations are done!"
