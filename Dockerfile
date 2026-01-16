FROM php:8.2-fpm

RUN apt-get update && apt-get install -y --no-install-recommends \
    libzip-dev \
    unzip \
    git \
    libicu-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libwebp-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j$(nproc) \
        pdo_mysql \
        zip \
        intl \
        gd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Ton code Symfony
WORKDIR /var/www/html
COPY . .

# Exemple : installe dépendances Composer en prod
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Permissions (optionnel pour Symfony)
RUN chown -R www-data:www-data var/ public/

CMD ["php-fpm"]
