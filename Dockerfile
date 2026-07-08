FROM php:8.4-apache

RUN apt-get update

RUN docker-php-ext-install mysqli pdo_mysql

COPY php.ini /usr/local/etc/php/conf.d/custom.ini

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite

# FROM php:8.4-apache

# RUN apt-get update

# # Install MySQL
# RUN docker-php-ext-install mysqli

# # Extension Moodle - zip
# # RUN apt-get update && apt-get install -y \
# #             libzip-dev \
# #             zip \
# #     && docker-php-ext-install zip

# # # Extension Moodle - intl
# # RUN apt-get update && apt-get install -y libicu-dev \
# #     && docker-php-ext-configure intl \
# #     && docker-php-ext-install intl


# # RUN apt-get update && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libgd-dev \
# #     && docker-php-ext-configure gd \
# #     && docker-php-ext-install gd

# # # Extension Moodle - soap
# # RUN apt-get update && apt-get install -y libxml2-dev \
# #     && docker-php-ext-install soap

# # # Extension Moodle - exif
# # RUN apt-get update && apt-get install -y exiftool \
# #     && docker-php-ext-configure exif \
# #     && docker-php-ext-install exif \
# #     && docker-php-ext-enable exif 

# # # Extension Moodle - opcache
# # RUN docker-php-ext-install opcache


# # 1. Copy your custom configuration file to the sites-available directory
# COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# # 2. Explicitly enable the site configuration (and optional modules like rewrite)
# RUN a2ensite 000-default.conf 

# # Restart
# RUN a2enmod rewrite

# # Symbolic link
# # RUN ln -s /var/www/moodle/public/ /var/www/html/moodle

