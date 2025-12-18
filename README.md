# Basic frankenphp php8.4 alpine image

### PHP extensions

Compiled with PHP extensions:
- pdo_mysql
- redis
- gd
- zip
- exif
- pcntl
- bcmath
- intl

### PHP.INI

PHP.INI values:

```ini
realpath_cache_size=4096K
realpath_cache_ttl=600
memory_limit=512M
max_execution_time=300
post_max_size=50M
upload_max_filesize=50M
# OPCACHE
opcache.enable=1
opcache.jit=tracing
opcache.jit_buffer_size=100M
opcache.interned_strings_buffer=16
opcache.memory_consumption=256
```

### Installed bash

Bash for laravel artisan commands like:
```bash
docker compose app artisan
```