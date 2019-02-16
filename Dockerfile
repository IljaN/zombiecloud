FROM php:7.2-cli-alpine AS buildenv
WORKDIR /tmp/core_src
RUN apk upgrade && apk update && apk add \
    build-base \
    bash \
    git \
    composer \
    npm \
    patch \
    nodejs && \
    npm install -g yarn && \
    git clone --depth 1 https://github.com/owncloud/core.git . && \
    pwd && \
    ls

COPY patch/ .

RUN patch -p0 < constring.patch

RUN make build/dist/owncloud-core.tar.bz2

FROM php:7.2-fpm-alpine
RUN apk upgrade && apk update && apk add \
    php-gd \
    php-json \
    php-pgsql \
    php-curl \
    php-intl \
    php-zip \
    php-xml \
    php-mbstring \
    php-soap \
    php-ldap \
    php7-apcu \
    tar

WORKDIR /srv
COPY --from=buildenv /tmp/core_src/build/dist/owncloud-core.tar.bz2 /srv
RUN tar xvjf ./owncloud-core.tar.bz2 -C /srv \
    && rm ./owncloud-core.tar.bz2 \
    && addgroup -S nginx && adduser -S nginx -G nginx \
    && chown -R nginx:nginx /srv/owncloud \
    && kill -USR2 1


