#!/bin/bash

apt install mariadb-server -y

apt-get install vim lsof -y

service mariadb start
mariadb -u root -e "CREATE DATABASE wpclidemo;"
mariadb -u root -e "CREATE USER 'aababach'@'%' IDENTIFIED BY 'pass123';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON wpclidemo.* TO 'aababach';"
mariadb -u root -e  "FLUSH PRIVILEGES;"


DB_CONN="mysql --host=localhost --user=aababach --password=pass123"

sleep 2

while ! $DB_CONN -e "SELECT 1;" > /dev/null 2>&1 ; do
    echo "-> $DB_CONN"
    echo "Waiting for MariaDB to start..."
    sleep 1
done

wp cli update
wp core download --path=/var/www/html --allow-root
wp config create --dbname=wpclidemo --dbuser=aababach --dbpass=pass123 --allow-root

# wp db create --allow-root
wp core install --url=wp --title="WP-CLI" --admin_user=aababach --admin_password=pass123 --admin_email=info@wp-cli.org --allow-root
php-fpm7.4 -RF