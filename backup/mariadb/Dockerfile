FROM alpine:3.14

RUN apk add --no-cache --upgrade bash

RUN apk update

RUN addgroup --gid 1042 mygrp
RUN addgroup root mygrp

RUN apk add mariadb mariadb-common mariadb-client

COPY ./tools/my_maria-setup.sh /tmp/my_maria-setup.sh
RUN chmod +x /tmp/my_maria-setup.sh

EXPOSE 3306

RUN /tmp/my_maria-setup.sh

CMD ["mysqld", "--user=root"]

