FROM alpine:3.14

COPY conf/redis_conf.sh /tmp/redis_conf.sh


RUN chmod -R 755 /tmp/

RUN apk update && apk upgrade && apk add \
bash \
redis \
dumb-init

RUN chmod -R 755 /tmp/

#ENTRYPOINT [ "/tmp/redis_conf.sh" ]

