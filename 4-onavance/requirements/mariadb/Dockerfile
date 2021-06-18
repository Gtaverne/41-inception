FROM debian:buster

RUN apt-get update
RUN apt-get install -y \
	mariadb-server \
	mariadb-client \
	bash \
	gettext-base \
	dumb-init


COPY ./conf/my.cnf /tmp
COPY ./tools/my_maria-setup.sh /tmp

RUN chmod 555 /tmp/my_maria-setup.sh
RUN mv ./tmp/my.cnf /etc/mysql/my.cnf && chmod 0755 /etc/mysql/my.cnf

#RUN /usr/bin/mysql_secure_installation

EXPOSE 3306

ENTRYPOINT ["./tmp/my_maria-setup.sh"]