#!/bin/bash

backup_cmd="echo '$PG_PASSWORD' | pg_dump --host=$PG_HOST --port=$PG_PORT --username=$PG_USER $PG_DB | gzip > /backup/db-backup.sql.gz"

# Write out backup script
echo "#!/bin/bash" > run-backup.sh
echo "$backup_cmd" > run-backup.sh
chmod 744 /run-backup.sh

if [ "$INIT_BACKUP" = "true" ]; then
    echo "Running Init Backup"
    bash /run-backup.sh
    echo "Done"
fi

# Create cron job
echo "$CRON_SCHEDULE /run-backup.sh" > /cron-jobs.txt

# Start Cron
exec supercronic /cron-jobs.txt

