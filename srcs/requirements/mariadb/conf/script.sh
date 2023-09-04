#!/bin/bash

service mariadb start
mariadb -u root -e "CREATE DATABASE wpclidemo;"
mariadb -u root -e "CREATE USER 'aababach'@'%' IDENTIFIED BY 'pass123';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON wpclidemo.* TO 'aababach';"
mariadb -u root -e "FLUSH PRIVILEGES;"
service mariadb stop

sed -i '30c\bind-address            = 0.0.0.0' /etc/mysql/mariadb.conf.d/50-server.cnf

mariadbd