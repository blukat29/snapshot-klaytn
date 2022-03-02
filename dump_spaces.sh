#!/bin/sh

set -x
# Compact output https://stackoverflow.com/a/46806801
echo 'select settings from spaces' | ./sql.sh -sN \
    | jq -s . | jq '.[] | {name, admins, filters, network, strategies}'
#    | jq -MRsr 'gsub("\n      +";"")|gsub("\n    ]";"]")'
