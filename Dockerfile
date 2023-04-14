FROM php:7.4-apache

# Set working directory
WORKDIR /var/www/html

# Copy app files to container
COPY . /var/www/html

# Set permissions for Apache user
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html \
    && find /var/www/html -type d -exec chmod 777 {} \;


RUN docker-php-ext-install mysqli pdo_mysql

RUN a2enmod rewrite

EXPOSE 80

CMD ["apache2-foreground"]