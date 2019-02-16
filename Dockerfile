FROM php:7.2-cli-alpine AS buildenv
WORKDIR /tmp/core_src
RUN apk upgrade \
    && apk update \
    && apk add \
        build-base \
        bash \
        git \
        composer \
        npm \
        patch \
        nodejs \
    && npm install -g yarn \
    && git clone --depth 1 https://github.com/owncloud/core.git . \
    && wget https://marketplace.owncloud.com/api/v1/apps/files_primary_s3/1.0.3 -O ./apps/files_primary_s3.tar.gz \
    && tar -xzf ./apps/files_primary_s3.tar.gz -C ./apps \
    && rm ./apps/files_primary_s3.tar.gz

COPY patch/ .

RUN patch -p0 < constring.patch
RUN make build/dist/owncloud-core.tar.bz2

FROM php:7.2-fpm-alpine
RUN apk upgrade \
    && apk update \
    && apk add \
        build-base \
        autoconf \
        g++ \
        postgresql-dev \
        libpng-dev \
        curl-dev \
        icu-dev \
        libxml2-dev \
        openldap-dev \
    && docker-php-ext-install -j$(nproc) \
        opcache \
        pgsql \
        pdo_pgsql\
        gd \
        intl \
        zip \
        soap \
        ldap \
    && pecl install redis \
    && pecl install apcu \
    && docker-php-ext-enable \
        opcache \
        pdo_pgsql \
        redis \
        apcu

WORKDIR /srv
COPY --from=buildenv /tmp/core_src/build/dist/owncloud-core.tar.bz2 /srv
RUN tar -xjf ./owncloud-core.tar.bz2 -C /srv \
    && rm ./owncloud-core.tar.bz2 \
    && addgroup -S nginx \
    && adduser -S nginx -G nginx \
    && chown -R nginx:nginx /srv/owncloud \
    && kill -USR2 1


