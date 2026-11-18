FROM php:8.3-fpm

RUN docker-php-ext-install pdo_mysql mysqli

RUN printf "upload_max_filesize=10M\npost_max_size=10M\n" > /usr/local/etc/php/conf.d/uploads.ini

WORKDIR /var/www/html

COPY . .

RUN mkdir -p assets/uploads && chown -R www-data:www-data assets/uploads && chmod -R 775 assets/uploads