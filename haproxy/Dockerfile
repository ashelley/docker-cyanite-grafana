FROM centos:centos6
MAINTAINER Mike Brannigan <mikejbrannigan@gmail.com>

# Update the stuff
RUN yum update -y --quiet 
# Install EPEL
RUN rpm -Uvh --quiet --force http://mirrors.kernel.org/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm

# Install wget
RUN yum install -y --quiet wget

# Install haproxy
RUN yum install -y --quiet haproxy

# Expose /var/log
VOLUME [ "/var/log" ]

# Configure haproxy
COPY files/etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg

# Expose ports
EXPOSE 8080

# Run haproxy
ENTRYPOINT ["/usr/sbin/haproxy"]
CMD ["-db", "-f", "/etc/haproxy/haproxy.cfg"]
