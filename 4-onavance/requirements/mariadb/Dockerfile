FROM debian:buster

RUN apt-get update
RUN apt-get install -y \
	mariadb-server \
	mariadb-client \
	dumb-init

EXPOSE 3306
COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./tools/maria-setup.sh /tmp

RUN chmod 755 /tmp/maria-setup.sh
RUN chmod 755 /etc/mysql/my.cnf

ENTRYPOINT [ "/usr/bin/dumb-init" ]

CMD ["/tmp/maria-setup.sh"]