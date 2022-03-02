#!/bin/sh

set -x
cat snapshot-hub/src/helpers/database/schema.sql | ./sql.sh
