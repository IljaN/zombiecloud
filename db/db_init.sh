#!/bin/sh
HOST="db_node_1:26257"


./cockroach user set  owncloud --insecure --host=${HOST}
./cockroach user set  "www-data" --insecure --host=${HOST}

./cockroach sql --host=${HOST} --insecure --user=root -e "CREATE DATABASE owncloud; GRANT ALL ON DATABASE owncloud TO owncloud; "

./cockroach sql --host=${HOST} --insecure --database owncloud --user=root -e "IMPORT PGDUMP 'nodelocal:///owncloud.pg.sql';"
./cockroach sql --host=${HOST} --insecure --user=root -e "GRANT ALL ON TABLE owncloud.* TO \"www-data\"; "

