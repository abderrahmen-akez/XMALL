FROM composer:latest AS composer
WORKDIR /app
COPY . .
RUN composer install --no-dev --optimize-autoloader --no-interaction --no-scripts --prefer-dist

FROM php:8.2-fpm-alpine

RUN apk add --no-cache \
    nginx \
    libzip-dev \
    unzip \
    git \
    icu-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    libwebp-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j$(nproc) \
        pdo_mysql \
        zip \
        intl \
        gd \
    && apk del --no-cache $PHPIZE_DEPS

COPY --from=composer /app/vendor /var/www/html/vendor

# Copie ton code Symfony
WORKDIR /var/www/html
COPY . .

RUN echo "server { \
    listen ${PORT:-10000}; \
    server_name localhost; \
    root /var/www/html/public; \
    index index.php; \
    location / { \
        try_files \$uri /index.php\$is_args\$args; \
    } \
    location ~ \.php$ { \
        fastcgi_pass 127.0.0.1:9000; \
        fastcgi_index index.php; \
        include fastcgi_params; \
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name; \
    } \
}" > /etc/nginx/http.d/default.conf

RUN mkdir -p var/cache var/log var/sessions public \
    && chown -R www-data:www-data var/ public/ \
    && chmod -R 775 var/

ENV APP_ENV=prod
ENV APP_SECRET=dummy_secret_for_build_only_32_chars_long_enough

RUN php bin/console cache:warmup --env=prod || true

EXPOSE ${PORT:-10000}

CMD ["sh", "-c", "php-fpm & nginx -g 'daemon off;'"]
