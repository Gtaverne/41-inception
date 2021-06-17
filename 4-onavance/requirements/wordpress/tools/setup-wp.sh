echo "on rentre dans le .sh"

cd

[ -f /tmp/wp-config.php ] && sed -i -e "s|MYSQL_DATABASE|'$MYSQL_DATABASE'|g" /tmp/wp-config.php
[ -f /tmp/wp-config.php ] && sed -i -e "s|MYSQL_USER|'$MYSQL_USER'|g" /tmp/wp-config.php
[ -f /tmp/wp-config.php ] && sed -i -e "s|MYSQL_PASSWORD|'$MYSQL_PASSWORD'|g" /tmp/wp-config.php

sed -i -e "s|;daemonize = yes|daemonize = no|g" /etc/php/7.3/fpm/php-fpm.conf

[ -d /wordpress ] && rm -rf /var/www/wordpress
[ -d /wordpress ] && mv /wordpress /var/www/

[ -f /tmp/wp-config.php ] && mv /tmp/wp-config.php /var/www/wp-config.php



mkdir -p /run/php/

exec /usr/sbin/php-fpm7.3