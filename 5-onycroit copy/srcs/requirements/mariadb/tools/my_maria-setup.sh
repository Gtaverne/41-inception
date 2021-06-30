#!/bin/bash
service mysql start
sleep 5
dbreuse=$(echo "SHOW DATABASES" | mysql -u root | grep $MYSQL_DATABASE | wc -l)

echo "Do we have a db ?"
if [ $dbreuse == 1 ]; then
echo "Oui"
else
echo "Non, on en cree une vierge"
fi

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'" | mysql -u root
echo "GRANT ALL ON $MYSQL_DATABASE .* TO '$MYSQL_USER'@'%'" | mysql -u root



service mysql stop

exec /usr/sbin/mysqld -u root