FROM centos:6

COPY ./skel /

RUN yum install -y httpd curl wget perl
RUN yum update -y

#RUN wget -P /usr/local/sysadmin/scripts/ -nv -nH -nd -r -l0 --no-parent --reject='index.html*' http://oriole.dsc.umich.edu/rhel7/UMWEB
RUN wget -nv -nH -nd -r -l0 --no-parent --reject='index.html*' http://oriole.dsc.umich.edu/rhel7/UMWEB
#RUN wget -c 'http://oriole.dsc.umich.edu/rhel7/UMWEB/httpd-cosign-3.2.0-3.el6.x86_64.rpm'
#RUN rpm -ivh httpd-cosign-3.2.0-3.el6.x86_64.rpm
#RUN yum localinstall -y httpd-cosign-3.2.0-3.el6.x86_64.rpm
RUN yum localinstall -y httpd-cosign

RUN cp /index.html /var/www/html/.

RUN chmod +x init.sh

CMD ["./init.sh"]
