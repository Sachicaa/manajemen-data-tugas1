#!/bin/bash
SOURCE_DIR="$HOME/tugas1_baru/mount_disk"
BACKUP_DIR="$HOME/tugas1_baru/backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"
LOG_FILE="$BACKUP_DIR/backup.log"

mkdir -p "$BACKUP_DIR"

if sudo tar -czf "$BACKUP_FILE" "$SOURCE_DIR" 2>/dev/null; then
    echo "[$(date)] ✅ Backup berhasil: $BACKUP_FILE" >> "$LOG_FILE"
else
    echo "[$(date)] ❌ Backup GAGAL!" >> "$LOG_FILE"
fi
