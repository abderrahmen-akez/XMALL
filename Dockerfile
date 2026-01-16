# syntax=docker/dockerfile:1
FROM php:8.2-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    git \
    && docker-php-ext-install pdo_mysql zip intl gd

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Apache config
RUN a2enmod rewrite

WORKDIR /var/www/html
COPY . .

RUN composer install --no-dev --optimize-autoloader --no-interaction

# Permissions
RUN chown -R www-data:www-data var/

# Expose port
EXPOSE 80

CMD ["apache2-foreground"]
