#!/bin/sh
sleep 10
chown -R root. owncloud/config
owncloud/occ maintenance:install \
         --database "pgsql" \
         --database-host "db_lb:26257" \
         --database-name "owncloud" \
         --database-user "owncloud" \
         --database-pass "" \
         --admin-user "admin2" \
         --admin-pass "admin"

owncloud/occ app:enable files_primary_s3
owncloud/occ s3:create owncloud --accept-warning
chown -R www-data /srv/owncloud/config /srv/owncloud/data

docker-php-entrypoint
php-fpm
