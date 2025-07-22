#!/bin/bash

# Function to check if deleted files exist in a commit
get_deleted_files_in_commit() {
    commit_hash=$1
    deleted_files=$(git diff --name-status $commit_hash^! | grep -e 'D' | awk '{print $2}')
    if [ ! -z "$deleted_files" ]; then
        echo "$commit_hash - Deleted files:"
        echo "$deleted_files"
        echo
    fi
}

# Function to list commits with deleted files
list_commits_with_deleted_files() {
    git log --pretty=format:"%H" --reverse | while read commit_hash
    do
        get_deleted_files_in_commit $commit_hash
    done
}

# Function to list all commits (with or without deleted files)
list_all_commits() {
    git log --pretty=format:"%H - %s" --reverse
}

# Check if a repository path is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <repo_path> [deleted|all]"
    echo "  repo_path - Path to the git repository"
    echo "  deleted   - List only commits with deleted files"
    echo "  all       - List all commits"
    exit 1
fi

# Navigate to the provided repository path
repo_path=$1
if [ ! -d "$repo_path/.git" ]; then
    echo "The specified directory is not a git repository."
    exit 1
fi

cd "$repo_path" || exit

# Check for the second argument that determines the type of listing
if [ "$2" == "deleted" ]; then
    list_commits_with_deleted_files
elif [ "$2" == "all" ]; then
    list_all_commits
else
    echo "Usage: $0 <repo_path> [deleted|all]"
    echo "  repo_path - Path to the git repository"
    echo "  deleted   - List only commits with deleted files"
    echo "  all       - List all commits"
fi
