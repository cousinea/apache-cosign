FROM centos:6

COPY ./skel /

RUN yum install -y httpd
RUN yum install -y curl wget

RUN yum update -y

#RUN cd /share/sysadmin/linux/rpm/rhel6/UMWEB
#RUN yum localinstall UMweb-1.0.0-1.el6.x86_64
#RUN cd - 

RUN mkdir /rpm
RUN cd /rpm
RUN wget -c 'http://oriole.dsc.umich.edu/rhel7/UMWEB/httpd-cosign-3.2.0-3.el6.x86_64.rpm'
#RUN wget -c 'ftp://oriole.dsc.umich.edu/rhel7/UMWEB/*.rpm'
RUN cd 

RUN cp /index.html /var/www/html/.

RUN chmod +x init.sh

CMD ["./init.sh"]
