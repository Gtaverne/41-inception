FROM debian:buster

RUN apt-get update -y && apt-get install -y \
		wget \
		php7.3 \
		php7.3-mysql \
		php7.3-fpm \
		php7.3-curl \
		php7.3-gd \
		php7.3-intl \
		php7.3-mbstring \
		php7.3-soap \
		php7.3-xml \
		php7.3-xmlrpc \
		php7.3-zip

COPY tools/setup.sh ./tmp/setup.sh
#COPY tools/wp-config.php srcs/wp-config.php
RUN chmod 755 ./tmp/setup.sh


ENTRYPOINT ./tmp/setup.sh
EXPOSE 9000
