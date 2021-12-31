#!/bin/bash

mysqld_safe --skip-grant-tables &

sleep 5

echo "**********SHOW DATABASES*********"
echo "SELECT host, user, password FROM mysql.user;" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'
echo "*********************************"
echo "Check that the 'root' password is not empty"

dbreuse=$(echo "SHOW DATABASES" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'| grep $MYSQL_DATABASE | wc -l)

echo "Do we alread have a $MYSQL_DATABASE db ?"
if [ $dbreuse == 1 ]; then
echo "Yes"

else
echo "Non, on en cree une"
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'" | mysql -u root
echo "GRANT ALL ON $MYSQL_DATABASE .* TO '$MYSQL_USER'@'%'" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "When setting it up, change the root password"
echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');" | mysql -u root
fi

service mysql stop

sleep 5

echo "We launch the MYSQL DAEMON now"
exec /usr/sbin/mysqld