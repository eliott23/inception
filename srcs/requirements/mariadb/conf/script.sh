#!/bin/bash
service mariadb start
mariadb -u root -e "CREATE DATABASE $DB;"
mariadb -u root -e "CREATE USER '$USER'@'%' IDENTIFIED BY '$PASS';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON $DB.* TO '$USER';"
service mariadb stop

sed -i '30c\bind-address            = 0.0.0.0' /etc/mysql/mariadb.conf.d/50-server.cnf

exec mariadbd