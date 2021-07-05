FROM alpine:3.14

RUN apk --no-cache add vsftpd \
bash \
dumb-init

COPY conf/start_vsftpd.sh /tmp/start_vsftpd.sh
COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN chmod -R 755 /tmp/

EXPOSE 21 20 21000-21010

ENTRYPOINT ["/tmp/start_vsftpd.sh"]