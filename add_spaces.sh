#!/bin/sh

for file in $(find settings -type f)
do
    name=$(basename $file)
    settings=$(cat $file | jq -c .)
    sql="INSERT INTO spaces (id, settings, verified, created_at, updated_at) VALUES (\
         '$name', '$settings', 0, unix_timestamp(), unix_timestamp());"
    echo "* Inserting $file"
    echo $sql | ./sql.sh
done
