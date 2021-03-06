#FROM registry.access.redhat.com/rhel7/rhel:7.3
FROM centos:7

MAINTAINER "Myles Pollie" <mylespollie@gmail.com>

RUN yum -y update; yum clean all
RUN yum -y install httpd; yum clean all
RUN echo "Apache" >> /var/www/html/index.html
RUN yum -y install openscap-scanner; yum clean all
RUN yum -y install wget; yum clean all
RUN wget https://www.redhat.com/security/data/oval/Red_Hat_Enterprise_Linux_6.xml
RUN oscap oval eval --results rhsa-results-oval.xml --report oval-report.html Red_Hat_Enterprise_Linux_6.xml


EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD run-apache.sh /run-apache.sh
RUN chmod -v +x /run-apache.sh

CMD /bin/bash
