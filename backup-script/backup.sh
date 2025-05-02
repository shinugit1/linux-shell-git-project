#!/bin/bash

# 🌟 Enhanced Script to backup a directory with logs & cleanup

read -p "Enter the full path of the directory to back up: " source_dir

# 1️⃣ Validate source directory
if [ ! -d "$source_dir" ]; then
    echo "❌ Directory '$source_dir' does not exist."
    exit 1
fi

# 2️⃣ Create backup directory if not exists
backup_dir="backup"
mkdir -p "$backup_dir"

# 3️⃣ Delete old backups (older than 7 days)
find "$backup_dir" -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;

# 4️⃣ Set backup file name with timestamp
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
backup_file="$backup_dir/$(basename "$source_dir")_$timestamp.tar.gz"

# 5️⃣ Create the backup
tar -czf "$backup_file" "$source_dir" 2>> "$backup_dir/error.log"

# 6️⃣ Check if tar was successful
if [ $? -eq 0 ]; then
    echo "✅ Backup created at: $backup_file"
    echo "$(date): SUCCESS - $backup_file" >> "$backup_dir/backup.log"
else
    echo "❌ Backup failed. Check error.log."
    echo "$(date): FAIL - $source_dir" >> "$backup_dir/backup.log"
fi
