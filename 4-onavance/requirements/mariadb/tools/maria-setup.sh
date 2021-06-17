#construction de la DB wordpress, elle doit etre accessible sans mdp avec le compte root
service mysql start
sleep 5
#mysql -u root SHOW DATABASES

echo "BIIIIIIIIITE MEEEEEE\n\n\n\n"
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY 'MYSQL_PASSWORD'" | mysql -u root
echo "GRANT ALL ON $MYSQL_DATABASE .* TO 'MYSQL_USER'@'%'" | mysql -u root

echo "MARIAAAAAAAAAAA"

service mysql stop

exec /usr/sbin/mysqld -u root