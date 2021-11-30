#!/bin/bash


service mysql start
sleep 5

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root
dbreuse=$(echo "SHOW DATABASES" | mysql -u root -p'$MYSQL_ROOT_PASSWORD' | grep $MYSQL_DATABASE | wc -l)

echo $dbreuse

echo "Do we have a db ?"
if [ $dbreuse == 1 ]; then
echo "Yaisse"
else
echo "No, on en cree une vierge"
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci" | mysql -u root
echo "On modifie le pw root"
echo "Montrez les nous"
echo "SHOW DATABASES" | mysql -u root -p'$MYSQL_ROOT_PASSWORD' 
fi



# # -- Create admin
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'

# # -- Add rights to admin
echo "GRANT ALL on $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'

# # -- Allow connection to root user from any location
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'

# # -- Reload the grant table
echo "flush privileges;" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'

exec /usr/sbin/mysqld -u root

**************

#!/bin/bash

# sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
# /usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
# /usr/bin/mysqld_safe --datadir="/var/lib/mysql" --no-watch

echo "On rentre dans maria"


/usr/bin/mysqld_safe --datadir="/var/lib/mysql" --no-watch
#service mysql start

# sleep 5

# #echo "SHOW DATABASES" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'
# echo "Maria starte"


# dbreuse=$(echo "SHOW DATABASES" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'| grep $MYSQL_DATABASE | wc -l)

# echo "Do we have a db ?"
# echo dbreuse
# if [ $dbreuse == 1 ]; then
# echo "Yaisse"

# else
# echo "No, on en cree une vierge"
# echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci" | mysql -u root
# echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'" | mysql -u root
# echo "GRANT ALL ON $MYSQL_DATABASE .* TO '$MYSQL_USER'@'%'" | mysql -u root
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root
# echo "flush privileges;" | mysql -u root

# fi


service mysql stop

exec /usr/sbin/mysqld -u root

#/!bin/sh
sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
/usr/bin/mysqld_safe --datadir="/var/lib/mysql" --no-watch

# mysqld

until echo "show databases;" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'
do
	clear
	echo "mysql is not up"
done

# -- Create Database

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE CHARACTER SET utf8 COLLATE utf8_bin;" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'

# # -- Create admin
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'

# # -- Add rights to admin
echo "GRANT ALL on $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'

# # -- Allow connection to root user from any location
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'

# # -- Reload the grant table
echo "flush privileges;" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'

# # -- Enable logs in file
echo "SET GLOBAL log_output = 'FILE';" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'
echo "SET GLOBAL general_log_file = '/tmp/mysql.log';" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'
echo "SET GLOBAL general_log = 'ON';" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'
