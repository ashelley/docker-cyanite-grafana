FROM centos:centos6
MAINTAINER Mike Brannigan <mikejbrannigan@gmail.com>

# Cassandra Repo
COPY files/etc/yum.repos.d/datastax.repo /etc/yum.repos.d/datastax.repo

# Update the stuff
#RUN yum update -y --quiet

# Install EPEL
RUN rpm -Uvh --quiet --force http://mirrors.kernel.org/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm

# Install wget
RUN yum install -y --quiet wget

# Install JVM
WORKDIR /tmp
RUN wget --quiet --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-x64.rpm
RUN rpm -Uvh --quiet jdk-7u67-linux-x64.rpm

# Install cassandra
RUN yum install -y --quiet dsc20 cassandra=2.0.11

# Expose /var/log
VOLUME [ "/var/log" ]

# Startup script
COPY files/etc/init.d/init-cassandra /etc/init.d/init-cassandra

# Expose ports
EXPOSE 7199 7000 7001 9160 9042

# Run cassandra
USER root
CMD ["/etc/init.d/init-cassandra"]
