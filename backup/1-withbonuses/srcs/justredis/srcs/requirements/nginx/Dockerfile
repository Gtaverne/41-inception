FROM debian:buster

#COPY conf/host /etc/


RUN apt-get update -y && apt-get install -y \
		bash \
		dumb-init \
		nginx \
		openssl

COPY conf/config_nginx /etc/nginx/nginx.conf
RUN mkdir -p /etc/nginx/ssl

#Generation d'une clef
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/gtaverne.key -out /etc/nginx/ssl/gtaverne.crt \
	-subj "/C=FR/ST=Paris/L=Paris/O=42Paris/OU=gtaverne.42.fr/CN=gtaverne.42.fr"

ENTRYPOINT ["nginx", "-g", "daemon off;"]

EXPOSE 443