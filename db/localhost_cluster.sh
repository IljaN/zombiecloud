#!/usr/bin/env bash

# Starts a 3 node dev-cluster with owncloud schema on the local host machine

cd "$(dirname "$0")"

cockroach start \
    --insecure \
    --store=localhost_data/node1 \
    --listen-addr=localhost \
    --background

sleep 2

cockroach start \
   --insecure \
   --store=localhost_data/node2 \
   --listen-addr=localhost:26258 \
   --http-addr=localhost:8081 \
   --join=localhost:26257 \
   --background

cockroach start \
   --insecure \
   --store=localhost_data/node3 \
   --listen-addr=localhost:26259 \
   --http-addr=localhost:8082 \
   --join=localhost:26257 \
   --background

(tail -f ./localhost_data/*/logs/cockroach.log | grep "webui:" -B2 -A10) &
sleep 10

echo Importing initial "owncloud" database..
mkdir -p ./localhost_data/node1/extern  ./localhost_data/node2/extern ./localhost_data/node3/extern

echo Creating db-user "owncloud" with password "owncloud"
cockroach user set owncloud --insecure
cockroach user set www-data --insecure

cp ./owncloud.pg.sql  ./localhost_data/node1/extern
cp ./owncloud.pg.sql  ./localhost_data/node2/extern
cp ./owncloud.pg.sql  ./localhost_data/node3/extern
cockroach sql --insecure --user=root -e "CREATE DATABASE owncloud; GRANT ALL ON DATABASE owncloud TO owncloud; "
cockroach sql --insecure --database owncloud --user=root -e "IMPORT PGDUMP 'nodelocal:///owncloud.pg.sql';"
cockroach sql --insecure --user=root -e "GRANT ALL ON TABLE owncloud.* TO \"www-data\"; "


echo "Type 'pkill cockroach' to shutdown all nodes!"









