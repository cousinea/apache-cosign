#!/bin/bash

cd /

build=$(cat build)

sed -i -e "s|<containerid>|$(hostname)|g"  \
       -e "s|<build>|$build|g"       \
       /var/www/html/index.html

PASSVAL=`grep PASSWORD /password | cut -d= -f2`

sed -i "s/PASSWORD/$PASSVAL/g" /var/www/html/index.html

#mkdir -p /usr/local/httpd/conf
#ls -l /usr
#ls -l /usr/local
#ls -l /usr/local/httpd
#ls -l /usr/local/httpd/conf
#ls -l /usr/local/httpd/conf/httpd.conf
#ls -l /usr/local/httpd/conf/extra/httpd-ssl.conf
#cp /usr/local/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf

#/usr/sbin/httpd -DFOREGROUND -f /usr/local/httpd/conf/httpd.conf
/usr/sbin/httpd -DFOREGROUND
