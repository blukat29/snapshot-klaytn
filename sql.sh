#!/bin/sh

extra_opts="$@"

if [ ! -t 0 ]; then
    disable_tty="-T"
else
    disable_tty=""
fi

set -x
docker-compose exec $disable_tty db mysql -u root --password=mypassword $extra_opts snapshot
