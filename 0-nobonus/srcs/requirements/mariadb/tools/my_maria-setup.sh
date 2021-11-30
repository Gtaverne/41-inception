#!/bin/bash

service mysql start

#mysqld_safe --init-file=/tmp/mysql-init.sql &


sleep 10

echo "**********SHOW DATABASES*********"
echo "SHOW DATABASES" | mysql -u root
echo "*********************************"

dbreuse=$(echo "SHOW DATABASES" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'| grep $MYSQL_DATABASE | wc -l)

echo "Do we have a db ?"
if [ $dbreuse == 1 ]; then
echo "Yaisse"

else
echo "Non"
# service mysql start
# echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci" | mysql -u root
# echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'" | mysql -u root
# echo "GRANT ALL ON $MYSQL_DATABASE .* TO '$MYSQL_USER'@'%'" | mysql -u root
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root
# echo "flush privileges;" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'
fi

sleep infinity

exec /usr/sbin/mysqld -u mysql
#--defaults-file=/etc/mysql/my.cnf