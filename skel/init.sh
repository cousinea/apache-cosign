#!/bin/bash

cd /

build=$(cat build)

sed -i -e "s|<containerid>|$(hostname)|g"  \
       -e "s|<build>|$build|g"       \
       /var/www/html/index.html

PASSVAL=`grep PASSWORD /password | cut -d= -f2`

sed -i "s/PASSWORD/$PASSVAL/g" /var/www/html/index.html

ls -l /usr/local/httpd/conf/httpd.conf
ls -l /usr/local/httpd/conf/extra/httpd-ssl.conf
ls -l /usr/local/httpd/conf

/usr/sbin/httpd -DFOREGROUND -f /usr/local/httpd/conf/httpd.conf
