# OpenStack Glance 0.2

FROM ubuntu:12.04

# Set correct environment variables.
ENV HOME /opt

# Generate locale files
RUN locale-gen en_US.UTF-8

# Export it
ENV LANG en_US.UTF-8

# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

# Setup for keystone
RUN apt-mark hold initscripts udev plymouth mountall
RUN apt-get update
RUN apt-get -y install git-core python-setuptools build-essential python-dev\
                       libxslt1-dev libxml2-dev libsqlite3-dev libldap2-dev\
                       libsasl2-dev curl libffi-dev
RUN easy_install --upgrade pip
RUN pip install pbr dnspython

# Get keystone source
RUN git clone https://github.com/openstack/glance -b stable/havana /opt/glance
RUN cd /opt/glance; git checkout stable/havana && python setup.py install --prefix /usr
RUN mkdir -p /etc/glance/ && mv /opt/glance/etc/* /etc/glance/

# CMD /opt/keystone/bin/keystone-all --config-dir=/etc/keystone

# Keystone service and admin API
EXPOSE 9191 9292

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
