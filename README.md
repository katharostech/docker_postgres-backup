# Docker MongoDB Backup

Extreemly simple MongoDB backup container that simply dumps MongoDB to a file on a cron schedule.

## Usage

```
docker run -v backup-volume:/backup kadimasolutions/mongodb-backup
```

The backup will be written to `/backup/db-backup.archive.gz`. Backups will be run on the `CRON_SCHEDULE` and will replace the previously taken backup at each run.

## Environment Variables

### `CRON_SCHEDULE`

*Default:* `0 0 * * *`

### `INIT_BACKUP`

Set to `true` to do a backup when the container is started.

*Default:* `false`

### `MONGO_HOST`

*Default:* mongodb

### `MONGO_PORT`

*Default:* `27017`

