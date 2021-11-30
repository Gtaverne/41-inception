echo "On rentre dans le .sh"

cd
#Remplacera les valeurs fournies par le .env dans le wp-config
#On teste bien a chaque fois l'existence du fichier afin de pouvoir gerer les reboots
[ -f /tmp/wp-config.php ] && sed -i -e "s|MYSQL_DATABASE|'$MYSQL_DATABASE'|g" /tmp/wp-config.php
[ -f /tmp/wp-config.php ] && sed -i -e "s|MYSQL_USER|'$MYSQL_USER'|g" /tmp/wp-config.php
[ -f /tmp/wp-config.php ] && sed -i -e "s|MYSQL_PASSWORD|'$MYSQL_PASSWORD'|g" /tmp/wp-config.php
[ -f /tmp/wp-config.php ] && sed -i -e "s|WORDPRESS_DB_HOST|'$WORDPRESS_DB_HOST'|g" /tmp/wp-config.php

sed -i -e "s|;daemonize = yes|daemonize = no|g" /etc/php/7.3/fpm/php-fpm.conf

if [ ! -d "/var/www/wordpress" ]; then
echo "AUCUN SITE TROUVE"
echo "Installation d'un wordpress vierge"
mv /wordpress /var/www/
else
echo "Un site est pre-configure"
rm -rf /wordpress
fi

[ -f /tmp/wp-config.php ] && mv /tmp/wp-config.php /var/www/wordpress/wp-config.php


chmod -R 755 /var/www/
chmod -R 777 /var/www/wordpress/wp-content
mkdir -p /run/php/

wp redis enable --allow-root --path=/var/www/wordpress

exec /usr/sbin/php-fpm7.3