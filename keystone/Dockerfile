# OpenStack Keystone 0.2

# Use phusion/baseimage for proper sysinit
FROM phusion/baseimage:0.9.8

# Set correct environment variables.
ENV HOME /opt

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Setup for keystone
RUN apt-get update
RUN apt-get -y install git-core python-setuptools build-essential python-dev libxslt1-dev libxml2-dev libsqlite3-dev libldap2-dev libsasl2-dev python-keystoneclient curl
RUN easy_install --upgrade pip
RUN pip install pbr

# Get keystone source
RUN git clone https://github.com/openstack/keystone -b stable/havana /opt/keystone
RUN cd /opt/keystone && python setup.py install
RUN mkdir -p /etc/keystone && mv /opt/keystone/etc/* /etc/keystone && mv /etc/keystone/keystone.conf.sample /etc/keystone.conf
RUN echo -e "/usr/local/bin/keystone-all --config-dir /etc" > /etc/rc.local
RUN echo -e "exit 0" >> /etc/rc.local

# Keystone service and admin API
EXPOSE 5000 35357

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
