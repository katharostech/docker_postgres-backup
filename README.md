# Docker Postgres Backup

[![Build Status](https://cloud.drone.io/api/badges/katharostech/docker_postgres-backup/status.svg)](https://cloud.drone.io/katharostech/docker_postgres-backup)

Extreemly simple Postgres backup container that simply dumps a Postgresql DB to a file on a cron schedule.

## Usage

```
docker run -v backup-volume:/backup katharostech/postgres-backup
```

The backup will be written to `/backup/db-backup.sql.gz`. Backups will be run on the `CRON_SCHEDULE` and will replace the previously taken backup at each run.

## Environment Variables

### `CRON_SCHEDULE`

**Default:** `0 0 * * *`

### `INIT_BACKUP`

Set to `true` to do a backup when the container is started.

**Default:** `false`

### `PG_HOST`

**Default:** postgres

### `PG_PORT`

**Default:** `5432`

### `PG_USER`

**Default:** `postgres`

### `PG_PASSWORD`

**Default:** `password`

### `PG_DB`

**Default:** `postgres`

### `FAILURE_HOOK`

This allows you to insert a command will be run when a backup fails. You can use this to trigger a `curl` on a webhook to your chat software or something similar.

**Default:** `true`
