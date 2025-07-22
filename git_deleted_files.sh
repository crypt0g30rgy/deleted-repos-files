#!/bin/bash

# Check if repository path is passed as argument
if [ -z "$1" ]; then
    echo "Usage: $0 <repository-path>"
    exit 1
fi

REPO_PATH=$1

# Navigate to the repository directory
cd $REPO_PATH || exit 1

# Loop through all commits and extract deleted files
git log --oneline --reverse | while read commit_hash _; do
    echo "Commit: $commit_hash"
    git diff-tree --no-commit-id --name-status -r $commit_hash | grep -E '^\s*D' | cut -f2-
done
