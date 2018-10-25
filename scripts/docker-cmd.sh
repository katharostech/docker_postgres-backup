#!/bin/bash

backup_cmd="mongodump --host $MONGO_HOST --port $MONGO_PORT --archive=/backup/db-backup.archive.gz --gzip"

if [ "$INIT_BACKUP" = "true" ]; then
    echo "Running Init Backup"
    $backup_cmd
fi

# Create cron job
echo "$CRON_SCHEDULE $backup_cmd" > /cron-jobs.txt

# Start Cron
exec supercronic /cron-jobs.txt

