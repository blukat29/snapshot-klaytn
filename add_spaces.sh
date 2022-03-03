#!/bin/sh

add_space() {
    file=$1

    name=$(basename $file)
    settings=$(cat $file | jq -c .)
    sql="INSERT INTO spaces (id, settings, verified, created_at, updated_at) VALUES (\
         '$name', '$settings', 0, unix_timestamp(), unix_timestamp())\
         ON DUPLICATE KEY UPDATE
         settings='$settings'
         ;"

    echo "* Inserting $file"
    echo $sql | ./sql.sh
}

#for file in $(find settings -type f | sort)
#do
#    add_space $file
#done

add_space settings/baobab.klaytn.com
add_space settings/alpha.klaytn.com
add_space settings/cypress-klay.com
add_space settings/cypress-usdt.com

