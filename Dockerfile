FROM dunglas/frankenphp:php8.4-alpine AS base

# bash for artisan
RUN apk add --no-cache bash

# Install extensions
RUN install-php-extensions \
    pdo_mysql redis gd zip exif pcntl bcmath intl

# PHP config
RUN echo "realpath_cache_size=4096K" >> /usr/local/etc/php/conf.d/laravel.ini && \
    echo "realpath_cache_ttl=600" >> /usr/local/etc/php/conf.d/laravel.ini && \
    echo "memory_limit=512M" >> /usr/local/etc/php/conf.d/laravel.ini && \
    echo "max_execution_time=300" >> /usr/local/etc/php/conf.d/laravel.ini && \
    echo "post_max_size=50M" >> /usr/local/etc/php/conf.d/laravel.ini && \
    echo "upload_max_filesize=50M" >> /usr/local/etc/php/conf.d/laravel.ini && \
    # OPCACHE
    echo "opcache.enable=1" >> /usr/local/etc/php/conf.d/opcache.ini && \
    echo "opcache.jit=tracing" >> /usr/local/etc/php/conf.d/opcache.ini && \
    echo "opcache.jit_buffer_size=100M" >> /usr/local/etc/php/conf.d/opcache.ini && \
    echo "opcache.interned_strings_buffer=16" >> /usr/local/etc/php/conf.d/opcache.ini && \
    echo "opcache.memory_consumption=256" >> /usr/local/etc/php/conf.d/opcache.ini

# for docker compose run app artisan
RUN echo '#!/usr/bin/env bash' > /usr/local/bin/artisan && \
    echo 'php artisan "$@"' >> /usr/local/bin/artisan && \
    chmod +x /usr/local/bin/artisan

# labels
ARG PHP_VERSION=8.4
LABEL php.version="${PHP_VERSION}-extensions"
