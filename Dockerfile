FROM php:7.4-apache

# Set working directory
WORKDIR /var/www/html

# Copy app files to container
COPY . /var/www/html

# Set permissions for Apache user
RUN chown -R $USER:www-data /var/www/html;


RUN docker-php-ext-install mysqli pdo_mysql
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN a2enmod rewrite

EXPOSE 90

CMD ["apache2-foreground"]