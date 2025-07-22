# deleted-repos-files
A bash script to retrieve deletd files over the git repos life

# usage

1. Make it executable:

```bash
chmod +x git_deleted_files.sh
```

2. Run the script by providing the repository path with the filter:

```bash
./git_deleted_files.sh /path/to/repo [deleted/all]
```

3. Example Output

```bash
commit_hash_1 - Date of deletion: 2023-07-15 14:23:45 -0700
Deleted files:
path/to/deleted/file1.txt
path/to/deleted/file2.txt
Git Checkout command: git checkout commit_hash_1

commit_hash_2 - Date of deletion: 2023-07-10 10:05:30 -0700
Deleted files:
path/to/deleted/file3.txt
Git Checkout command: git checkout commit_hash_2
```
