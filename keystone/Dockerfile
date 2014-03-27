# OpenStack Keystone 0.2

# Use phusion/baseimage for proper sysinit
#FROM phusion/baseimage:0.9.8
FROM ubuntu:12.04

# Set correct environment variables.
ENV HOME /opt
# ENV PYTHONPATH /opt/keystone:$PYTHONPATH

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
# RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
# CMD ["/sbin/my_init"]

# Setup for keystone
RUN apt-mark hold initscripts udev plymouth mountall
RUN apt-get update
RUN apt-get -y install git-core python-setuptools build-essential python-dev libxslt1-dev libxml2-dev libsqlite3-dev libldap2-dev libsasl2-dev curl
RUN easy_install --upgrade pip
RUN pip install pbr dnspython

# Get keystone source
RUN git clone https://github.com/openstack/keystone -b stable/havana /opt/keystone
# RUN cd /opt/keystone && python tools/install_venv.py
RUN cd /opt/keystone && python setup.py install --prefix /usr
RUN mkdir -p /etc/keystone/ && mv /opt/keystone/etc/* /etc/keystone/
ADD keystone.conf /etc/keystone/
# RUN mkdir -p /etc/my_init.d
# ADD keystone.sh /etc/my_init.d/

# Keystone service and admin API
EXPOSE 5000 35357

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
