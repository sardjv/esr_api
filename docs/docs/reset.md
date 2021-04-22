---
id: reset
title: System Reset
slug: reset
---

After a testing period, or if there has been data corruption, you may need to do a total reset of the system and start again from scratch.

:::danger

This will irrevocably delete ALL local data, ALL tokens, ALL admins and any other history or data which has been built up while using the wrapper. You will need to start again completely, adding all users again and creating new tokens. You will need to re-add FTP Credentials, which will request a new seed file from the remote FTP server.

:::danger

```
# Shut down the running system.
docker-compose down --remove-orphans

# List and remove volumes. THIS WILL REMOVE ALL USERS, TOKENS, DATA AND HISTORY.
docker volume ls
docker volume rm esr_api_db
docker volume rm esr_api_redis
docker volume rm esr_api_bundle_cache (Dev mode only)
docker volume rm esr_api_db_test (Dev mode only)

# Remove all stopped containers, caches and unused images from the entire system.
# WARNING: This is not limited to only this project, and will affect any other Docker systems you have
# on the same server.
docker system prune -a

# (Dev mode only)
# Remove file indicating that the system has already been set up.
rm script/first_run_complete.tmp

# Remove all downloaded and uploaded .DAT files.
rm -rf data/
```

You can then follow the [Quickstart Guide](quickstart.md) to set the system up again.
