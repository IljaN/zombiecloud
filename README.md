# Zombie Cloud

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
## Video
[![Video](https://img.youtube.com/vi/RyrTvzMkV8M/0.jpg)](https://www.youtube.com/watch?v=RyrTvzMkV8M)
