#!/bin/bash

apt-get install vim lsof -y

wp cli update
wp core download --path=/var/www/html --allow-root
wp config create --dbhost=mariadb --dbname=$DB --dbuser=$USER --dbpass=$PASS --allow-root

# wp db create --allow-root
wp core install --url=$USER.42.fr --title="WP-CLI" --admin_user=$USER --admin_password=$PASS --admin_email=info@wp-cli.org --allow-root
wp user create zoro zoro@example.com --user_pass=$PASS1 --role=author --allow-root
php-fpm7.4 -RF