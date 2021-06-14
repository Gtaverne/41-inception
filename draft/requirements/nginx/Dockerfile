FROM debian:buster

COPY conf/config_nginx srcs/config_nginx
COPY tools/setupnginx.sh ./tmp/setup.sh

RUN apt-get update -y && apt-get install -y \
		wget \
		bash \
		nginx \
		openssl

RUN mkdir -p /etc/nginx/ssl
#Voir le detail du chemin ou ecrire la clef
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.pem -subj "/C=FR/ST=Paris/L=Paris/O=42Paris/OU=gtaverne/CN=localhost"

#ENTRYPOINT ["nginx", "-g", "daemon off;"]
RUN chmod 755 ./tmp/setup.sh


ENTRYPOINT ./tmp/setup.sh
EXPOSE 80
EXPOSE 443