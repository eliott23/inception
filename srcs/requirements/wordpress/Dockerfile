FROM debian:bullseye

RUN apt-get update -y

RUN apt-get install vim lsof -y

RUN apt-get install -y php7.4 php7.4-fpm

RUN mkdir -p /run/php/

COPY conf /etc/php/7.4/fpm/pool.d/www.conf

COPY info.php /var/www/html/info.php

CMD ["php-fpm7.4", "-RF"]