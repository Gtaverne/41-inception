#!/bin/bash

# service mysql start
# mysqld_safe --init-file=/tmp/mysql-init.sql &


sleep 10

echo "**********SHOW DATABASES*********"
echo "SHOW DATABASES" | mysql -u root
echo "*********************************"

dbreuse=$(echo "SHOW DATABASES" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'| grep $MYSQL_DATABASE | wc -l)

echo "Do we alread have a $MYSQL_DATABASE db ?"
if [ $dbreuse == 1 ]; then
echo "Yaisse"

else
echo "Non, on a un probleme"
fi

exec /usr/sbin/mysqld -u mysql &
#--defaults-file=/etc/mysql/my.cnf