FROM php:8.2-fpm-alpine

RUN apk add --no-cache \
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


COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html
COPY . .

ENV APP_ENV=prod
ENV APP_SECRET=dummy_secret_for_build_only_32_chars_long_enough

RUN composer install \
    --no-dev \
    --optimize-autoloader \
    --no-interaction \
    --no-scripts \
    --no-progress \
    --prefer-dist

RUN mkdir -p var/cache var/log var/sessions \
    && chown -R www-data:www-data var/ public/

RUN php bin/console cache:warmup --env=prod || true

CMD ["php-fpm"]
