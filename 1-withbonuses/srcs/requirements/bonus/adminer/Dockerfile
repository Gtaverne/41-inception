FROM alpine:3.14

#Un grand merci a "Milan Sulc <sulcmil@gmail.com>"

ENV ADMINER_VERSION=4.8.1
ENV MEMORY=256M

RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    echo '@community http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    apk update && apk upgrade && apk add \
        wget \
        ca-certificates \
        php7@testing \
        php7-session@testing \
        php7-mysqli@community \
        php7-pgsql@testing \
        php7-json@testing \
        php7-pecl-mongodb@testing \
        dumb-init && \
        wget https://github.com/vrana/adminer/releases/download/v$ADMINER_VERSION/adminer-$ADMINER_VERSION.php -O /srv/index.php && \
    apk del wget ca-certificates && \
    rm -rf /var/cache/apk/*

WORKDIR /srv
EXPOSE 8080

ENTRYPOINT ["dumb-init", "--"]

CMD /usr/bin/php \
    -d memory_limit=$MEMORY \
    -S 0.0.0.0:8080