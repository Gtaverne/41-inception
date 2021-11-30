FROM debian:buster

RUN apt-get update && apt-get install -y\
	php-fpm \
	php-mysql \
	tar \
	curl \
	redis \
	php-redis\
	dumb-init


RUN curl -LO http://wordpress.org/latest.tar.gz
RUN tar -zvxf latest.tar.gz
RUN rm -rf latest.tar.gz

RUN echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

COPY ./conf/wp-config.php /tmp/wp-config.php
COPY ./tools/setup-wp.sh setup-wp.sh

ENTRYPOINT [ "/usr/bin/dumb-init" ]

EXPOSE 9000

CMD ["bash", "setup-wp.sh"]