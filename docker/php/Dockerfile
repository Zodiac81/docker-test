FROM php:7.4-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo_pgsql

RUN docker-php-ext-install pdo pdo_pgsql
RUN docker-php-ext-install sockets
RUN pecl install apcu

RUN apt-get update
RUN apt-get install -y libzip-dev apt-utils curl

RUN docker-php-ext-install zip
RUN docker-php-ext-enable apcu

RUN dpkg --add-architecture i386

RUN apt-get update
RUN apt-get install -y libc6:i386 libx11-6:i386 gconf-service libasound2 libatk1.0-0 libatk-bridge2.0-0 libc6 \
libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 \
libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 \
libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates \
fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

RUN apt-get install -y nodejs npm
RUN npm install npm@latest -g
RUN chown -R 1000:1000 "/var/www"

RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --filename=composer
RUN php -r "unlink('composer-setup.php');"
RUN mv composer /usr/local/bin/composer

RUN pecl install xdebug-2.9.0
RUN docker-php-ext-enable xdebug

WORKDIR /usr/src/app

RUN PATH=$PATH:/usr/src/apps/vendor/bin:bin