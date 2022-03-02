#!/bin/sh

set -ex

cat snapshot-hub/src/helpers/database/schema.sql \
    | docker-compose exec -T db mysql -u root --password=mypassword snapshot

