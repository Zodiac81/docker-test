FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql

RUN apt update && apt install -y \
    bash-completion \
    sudo \
    git \
    zip \
    unzip \
    nano \
    wget \
    netcat \
    curl
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html/woc
