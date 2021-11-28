#!/bin/bash
service mysql start
sleep 10
echo "CREATE DATABASE IF NOT EXISTS wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root
echo "UPDATE mysql.user set plugin='mysql_native_password' WHERE user='root';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
./usr/bin/mysqld_safe