#!/bin/bash

DOWNLOAD_DIR="$HOME/Downloads"  # Adjust this to your actual download directory
LOGFILE="$HOME/torrent_monitor.log"

echo "Starting torrent monitor at $(date)" >> "$LOGFILE"

inotifywait -m -e close_write --format "%w%f" "$DOWNLOAD_DIR" | while read FILE; do
    echo "Detected file: $FILE at $(date)" >> "$LOGFILE"
    if [[ "$FILE" == *.torrent ]]; then
        echo "Opening $FILE with qBittorrent at $(date)" >> "$LOGFILE"
        qbittorrent "$FILE"
    fi
done
