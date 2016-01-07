FROM centos:6

COPY ./skel /

RUN yum install -y httpd

RUN yum update -y
RUN yum localinstall /share/sysadmin/linux/rpm/rhel6/UMWEB/UMweb-1.0.0-1.el6.x86_64.rpm

RUN chmod +x init.sh

CMD ["./init.sh"]
