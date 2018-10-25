#!/bin/bash

# Create cron job
echo "$CRON_SCHEDULE mongodump --host $MONGO_HOST --port $MONGO_PORT --archive --gzip > /backup/db-backup.archive.gz" > /cron-jobs.txt

# Start Cron
exec supercronic /cron-jobs.txt

