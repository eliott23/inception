#!/bin/bash

apt-get install vim lsof -y

wp cli update
wp core download --path=/var/www/html --allow-root
wp config create --dbhost=mariadb --dbname=wpclidemo --dbuser=aababach --dbpass=pass123 --allow-root

# wp db create --allow-root
wp core install --url=aababach.42.fr --title="WP-CLI" --admin_user=aababach --admin_password=pass123 --admin_email=info@wp-cli.org --allow-root
php-fpm7.4 -RF