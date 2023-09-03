FROM debian:bullseye

RUN apt-get update -y

RUN apt-get install -y php php-mysql php-curl php-gd php-mbstring php-xml php7.4-mysql php7.4-fpm \
curl mariadb-client

RUN mkdir -p /run/php/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp

COPY script.sh script.sh

RUN chmod +x script.sh

COPY conf /etc/php/7.4/fpm/pool.d/www.conf

COPY info.php /var/www/html/info.php

WORKDIR /var/www/html

CMD ["/script.sh"]