# Étape 1 : Builder Composer
FROM composer:latest AS composer
WORKDIR /app
COPY . .
RUN composer install --no-dev --optimize-autoloader --no-interaction --no-scripts --prefer-dist

# Étape 2 : Image finale avec PHP + Nginx
FROM php:8.2-fpm-alpine

# Installe Nginx + extensions PHP
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

# Copie Composer vendor du builder
COPY --from=composer /app/vendor /var/www/html/vendor

# Copie ton code Symfony
WORKDIR /var/www/html
COPY . .

# Configure Nginx pour écouter sur $PORT (défaut 10000 sur Render)
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

# Crée dossiers var/ + permissions
RUN mkdir -p var/cache var/log var/sessions public \
    && chown -R www-data:www-data var/ public/ \
    && chmod -R 775 var/

# Variables pour build
ENV APP_ENV=prod
ENV APP_SECRET=dummy_secret_for_build_only_32_chars_long_enough

# Warmup cache (ignore erreurs)
RUN php bin/console cache:warmup --env=prod || true

# Expose le port (optionnel, mais aide Render à détecter)
EXPOSE ${PORT:-10000}

# Lance Nginx + PHP-FPM en foreground
CMD ["sh", "-c", "php-fpm & nginx -g 'daemon off;'"]
