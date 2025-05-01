# this is for backup file

#!/bin/bash

# Script to backup a directory

read -p "Enter the full path of the directory to back up: " source_dir

# Check if source directory exists
if [ ! -d "$source_dir" ]; then
    echo "❌ Directory '$source_dir' does not exist."
    exit 1
fi

# Create backup directory if it doesn't exist
backup_dir="backup"
mkdir -p "$backup_dir"

# Set backup file name
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
backup_file="$backup_dir/$(basename "$source_dir")_$timestamp.tar.gz"

# Create the backup
tar -czf "$backup_file" "$source_dir"

echo "✅ Backup created at: $backup_file"
