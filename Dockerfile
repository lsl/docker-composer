FROM composer:latest

RUN composer global require hirak/prestissimo \
    --prefer-dist \
    --prefer-stable \
    --no-progress \
    --no-scripts \
    --no-suggest \
    --no-interaction \
    --ansi

RUN echo 'composer install \
    --ignore-platform-reqs \
    --no-dev \
    --no-autoloader \
    --no-scripts \
    --no-progress \
    --no-suggest \
    --no-interaction \
    --ansi "$@"' > /usr/bin/composer-install && \
    chmod +x /usr/bin/composer-install

RUN echo 'composer dump-autoload \
    --optimize \
    --classmap-authoritative \
    --apcu \
    --no-dev \
    --ansi "$@"' > /usr/bin/composer-dump-autoload && \
    chmod +x /usr/bin/composer-dump-autoload
