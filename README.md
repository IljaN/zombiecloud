#Zombie Cloud

Compose file for experimental ownCloud on cockroach-db, haproxy, nginx-fpm and objectstore

```
       +-------------------+
       |       NGINX       |
       |                   |
       +-------------------+
                |
                |
       +-------------------+         +-------------------+
       |ownCloud (php-fpm) |         |    Scality S3     |
       |                   +---------+                   |
       +-------------------+         +-------------------+
                |
                |
       +-------------------+
       |     HAProxy       |
       |                   |
       +-------------------+
           |    |    |
           |    |    |
           |    |    |
       +-------------------+
       |CockroachDB Cluster|
       |                   |
       +-------------------+
```

*WARNING!* Not for production use! Work in progress, Insecure, Unstable, Experimental!