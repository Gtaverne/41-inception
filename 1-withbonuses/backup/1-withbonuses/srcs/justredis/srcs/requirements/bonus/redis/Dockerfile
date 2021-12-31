FROM alpine:3.14

COPY conf/redis_conf.sh /tmp/redis_conf.sh

RUN chmod -R 755 /tmp/

RUN apk update && apk upgrade && apk add \
bash \
redis \
dumb-init

RUN chmod -R 755 /tmp/
COPY conf/redis.conf /etc/redis.conf
COPY conf/sysctl.conf /etc/sysctl.conf

EXPOSE 6379

ENTRYPOINT [ "/tmp/redis_conf.sh" ]
