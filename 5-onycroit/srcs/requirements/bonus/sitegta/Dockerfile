FROM alpine:3.14

RUN apk --no-cache add nginx

COPY site/index.html /tmp/index.html
COPY site/main.css /tmp/main.css

COPY conf/config_nginx /etc/nginx/nginx.conf
RUN mkdir -p /etc/nginx/ssl

EXPOSE 7000:80

ENTRYPOINT ["nginx", "-g", "daemon off;"]