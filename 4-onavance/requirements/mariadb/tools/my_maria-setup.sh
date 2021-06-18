#!/bin/bash
service mysql start
sleep 5
echo "Mysql started\n"
env
echo "oh oh \n"
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'" | mysql -u root
echo "GRANT ALL ON $MYSQL_DATABASE .* TO '$MYSQL_USER'@'%'" | mysql -u root

echo "On est passe par toutes les etapes mysql"

service mysql stop

exec /usr/sbin/mysqld -u root