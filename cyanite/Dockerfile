FROM centos:centos6
MAINTAINER Mike Brannigan <mikejbrannigan@gmail.com>

# Update the stuff
#RUN yum update -y --quiet

# Install EPEL
RUN rpm -Uvh --quiet --force http://mirrors.kernel.org/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm

# Cassandra Repo
COPY files/etc/yum.repos.d/datastax.repo /etc/yum.repos.d/datastax.repo

# Install wget
RUN yum install -y --quiet wget

# Install JVM
WORKDIR /tmp
RUN wget --quiet --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-x64.rpm
RUN rpm -Uvh --quiet jdk-7u67-linux-x64.rpm

# Install cassandra
RUN yum install -y --quiet dsc20 cassandra=2.0.11

# Copy /opt/cyanite
COPY files/opt/cyanite/ /opt/cyanite/

# Copy /etc/cyanite.yaml
COPY files/etc/cyanite.yaml /etc/cyanite.yaml

# Expose /var/log
VOLUME ["/var/log"]

# Ports 2003 and 8080
EXPOSE 2003 8080

# Run
CMD [ "/opt/cyanite/cyanite.sh" ]
