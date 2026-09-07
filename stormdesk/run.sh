#!/bin/sh
# Hand the data directory to the unprivileged user, then become that user.
#
# `chown` is not recursive on purpose after the first run: an archive with years of rows in it is
# thousands of files to walk on every restart, and only the directory's own ownership decides
# whether the server can write.
set -e

mkdir -p /data
if [ "$(stat -c %u /data)" != "1000" ]; then
    chown -R 1000:1000 /data
fi

exec setpriv --reuid=1000 --regid=1000 --clear-groups \
    /usr/local/bin/stormdesk --headless
