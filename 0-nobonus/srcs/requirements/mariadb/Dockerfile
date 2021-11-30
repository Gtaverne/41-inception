FROM debian:buster

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD


RUN apt-get update
RUN apt-get install -y \
	mariadb-server \
	mariadb-client \
	gettext-base \
	dumb-init


COPY ./conf/my.cnf /tmp
COPY ./tools/my_maria-setup.sh /tmp

RUN chmod 555 /tmp/my_maria-setup.sh
RUN mv ./tmp/my.cnf /etc/mysql/my.cnf && chmod 0755 /etc/mysql/my.cnf

RUN echo "Is the variable initialized:" && echo $MYSQL_USER

EXPOSE 3306

RUN mysqld -umysql & \
	sleep 10 && \
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci" | mysql -u root && \
	echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'" | mysql -u root && \
	echo "GRANT ALL ON $MYSQL_DATABASE .* TO '$MYSQL_USER'@'%'" | mysql -u root && \
	echo "FLUSH PRIVILEGES};" | mysql -u root && \
	echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');" | mysql -u root &&
	

CMD ["/usr/sbin/mysqld",  "--user=mysql"]
# ENTRYPOINT ["./tmp/my_maria-setup.sh"]


# RUN service mysql start && \
# 	sleep 10 && \
# 	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci" | mysql -u root && \
# 	echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'" | mysql -u root && \
# 	echo "GRANT ALL ON $MYSQL_DATABASE .* TO '$MYSQL_USER'@'%'" | mysql -u root && \
# 	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root  && \
# 	echo "flush privileges;" | mysql -u root -p'$MYSQL_ROOT_PASSWORD' && \
# 	service mysql stop