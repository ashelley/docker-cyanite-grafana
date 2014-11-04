FROM centos:centos6
MAINTAINER Mike Brannigan <mikejbrannigan@gmail.com>

# Setup elasticsearch repo
RUN rpm --quiet --import http://packages.elasticsearch.org/GPG-KEY-elasticsearch

# Copy elasticsearch repo file
COPY files/etc/yum.repos.d/elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo

# Update the stuff
#RUN yum update -y --quiet 

# Install EPEL
RUN rpm -Uvh --quiet --force http://mirrors.kernel.org/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm

# Install wget and which
RUN yum install -y --quiet wget
RUN yum install -y --quiet which

# Install JVM
WORKDIR /tmp
RUN wget --quiet --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-x64.rpm
RUN rpm -Uvh --quiet jdk-7u67-linux-x64.rpm

# Install elasticsearch
RUN yum install -y --quiet elasticsearch

# Expose /var/log
VOLUME [ "/var/log" ]

# Expose ports
EXPOSE 9200 9300

# Run Elasticsearch
ENTRYPOINT [ "/usr/share/elasticsearch/bin/elasticsearch" ]
