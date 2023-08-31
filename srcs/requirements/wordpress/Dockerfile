FROM debian:bullseye

RUN apt-get update -y

RUN apt-get install vim lsof -y

RUN apt-get install -y php7.4 php7.4-fpm curl mariadb-server

RUN mkdir -p /run/php/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp

COPY script.sh script.sh

RUN chmod +x script.sh

COPY conf /etc/php/7.4/fpm/pool.d/www.conf

COPY info.php /var/www/html/info.php

CMD ["./script.sh"]