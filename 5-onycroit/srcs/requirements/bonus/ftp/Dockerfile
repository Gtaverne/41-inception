FROM alpine:3.14

RUN apk --no-cache add vsftpd

COPY conf/start_vsftpd.sh /bin/start_vsftpd.sh
COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21 21000-21010
VOLUME /ftp/ftp

ENTRYPOINT ["/bin/start_vsftpd.sh"]