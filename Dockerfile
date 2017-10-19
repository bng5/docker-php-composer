FROM php:7.1.10-fpm-jessie

RUN apt-get update && apt-get install -y \
        git \
        libssl-dev \
        unzip \
        zip

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === trim(file_get_contents('https://composer.github.io/installer.sig'))) { echo 'Installer verified'.PHP_EOL; } else { echo 'Installer corrupt'.PHP_EOL;  exit(1); }" && \
    php composer-setup.php --install-dir="/usr/local/bin/" --filename="composer" && \
    rm composer-setup.php

RUN useradd --create-home --shell /bin/bash --groups www-data admin
