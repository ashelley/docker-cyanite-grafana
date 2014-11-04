FROM centos:centos6
MAINTAINER Mike Brannigan <mikejbrannigan@gmail.com>

# Update the stuff
RUN yum update -y --quiet 
# Install EPEL
RUN rpm -Uvh --quiet --force http://mirrors.kernel.org/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm

# Install wget and git
RUN yum install -y --quiet wget
RUN yum install -y --quiet git

# Install httpd
RUN yum install -y --quiet httpd

# Install mod_wsgi
RUN yum install -y --quiet mod_wsgi

# Install cairo
RUN yum install -y --quiet cairo

# Install python-pip
RUN yum install -y --quiet python-pip

# Install development tools
RUN yum install -y --quiet gcc
RUN yum install -y --quiet cairo-devel
RUN yum install -y --quiet python-devel
RUN yum install -y --quiet libffi-devel

# Install graphite-api and cyanite
RUN pip install --quiet graphite-api
RUN pip install --quiet cyanite

# Expose /var/log
VOLUME [ "/var/log" ]
VOLUME [ "/var/www/html" ]

# graphite-api config
COPY files/etc/graphite-api.yaml /etc/graphite-api.yaml

# Graphite http config
COPY files/etc/httpd/conf.d/graphite.conf /etc/httpd/conf.d/graphite.conf

# Graphite wsgi script
COPY files/var/www/wsgi-scripts/graphite-api.wsgi /var/www/wsgi-scripts/graphite-api.wsgi

# Grafana
#ADD http://grafanarel.s3.amazonaws.com/grafana-1.8.1.tar.gz /var/www/html

# Grafana config
COPY files/var/www/html/config.js /var/www/html/config.js

# Create graphite directory
RUN mkdir -p /srv/graphite
RUN chown apache:apache /srv/graphite

# Expose ports
EXPOSE 8000 80

# Run apache
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
