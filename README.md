# PHP Composer with hirak/prestissimo

This docker image is expected to be used in a multistage build that requires a composer install step.

This image is a stable drop-in replacement for the official composer image if you already use it.

There are a couple of helper commands with some opinionated flags but the normal `composer` command is still available if you don't like the chosen defaults.

## Example usage

The below is geared towards a Laravel production build but can easily be tailored as needed.

```
FROM lslio/composer as composer

COPY ./composer.* /www/
RUN composer-install -d /www

COPY . /www
RUN composer-dump-autoload -d /www

FROM lslio/nginx-php-fpm

ENV SERVER_ROOT=/www/public
ENV SERVER_NAME=example.com

COPY --from=composer --chown=www-data:www-data /www /www
```
