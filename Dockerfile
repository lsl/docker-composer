FROM composer:latest

RUN composer global require hirak/prestissimo \
    --prefer-dist \
    --prefer-stable \
    --no-progress \
    --no-scripts \
    --no-suggest \
    --no-interaction \
    --ansi
