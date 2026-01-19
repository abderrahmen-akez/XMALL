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
    libpq-dev \
    gettext \
    nginx \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j$(nproc) \
        pdo_mysql pdo_pgsql \
        zip \
        intl \
        gd \
    && apk del --no-cache $PHPIZE_DEPS

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html
COPY . .

ENV APP_ENV=prod
ENV APP_SECRET=dummy_for_build_only_32_chars_long_enough
ENV APP_DEBUG=0

RUN composer install --no-dev --optimize-autoloader --no-interaction --no-scripts --no-progress --prefer-dist

RUN mkdir -p var/cache/prod var/log var/sessions public \
    && chown -R www-data:www-data var/ public/ \
    && chmod -R 777 var/  # Fix permission denied

RUN php bin/console cache:warmup || true

COPY <<EOF /etc/nginx/http.d/default.conf.template
server {
    listen 0.0.0.0:${PORT:-10000};
    server_name localhost;
    root /var/www/html/public;
    index index.php;

    # Force HTTPS redirect (fix 301 loop)
    if ($scheme = http) {
        return 301 https://$host$request_uri;
    }

    location / {
        try_files $uri $uri/ /index.php$is_args$args;
    }
    location ~ \.php$ {
        fastcgi_pass 127.0.0.1:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME "$document_root$fastcgi_script_name";
        fastcgi_param HTTPS on;  # Tell Symfony it's HTTPS
    }
}
EOF

EXPOSE ${PORT:-10000}

CMD ["sh", "-c", "envsubst < /etc/nginx/http.d/default.conf.template > /etc/nginx/http.d/default.conf && php-fpm -D && nginx -g 'daemon off;'"]
