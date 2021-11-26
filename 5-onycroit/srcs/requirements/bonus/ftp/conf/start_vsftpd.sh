#! /bin/sh

echo "$FTP_USER"
echo "$FTP_PASS"

{ echo "$FTP_PASS"; echo "$FTP_PASS"; } | adduser $FTP_USER

chgrp -R $FTP_USER /home/$FTP_USER
chmod -R 755 /home/ftp/
chmod -R g-w /home/$FTP_USER

vsftpd /etc/vsftpd/vsftpd.conf