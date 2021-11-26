#! /bin/sh


# { echo "$FTP_PASS"; echo "$FTP_PASS"; } | adduser $FTP_USER
{ echo "$FTP_PASS"; echo "$FTP_PASS"; } | adduser --home /home/ftp $FTP_USER


chgrp -R $FTP_USER /home/ftp/
echo "*********Here are the files the FTP can access**********" && \
cd /home/ftp/ && ls
chmod -R 755 /home/ftp/

vsftpd /etc/vsftpd/vsftpd.conf