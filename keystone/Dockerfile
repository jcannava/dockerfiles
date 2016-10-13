# OpenStack Keystone 0.2

FROM ubuntu:14.04

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
RUN apt-get -y install git-core python-setuptools build-essential python-dev libssl-dev
RUN easy_install --upgrade pip
RUN git clone https://git.openstack.org/openstack/keystone -b stable/newton /opt/keystone
RUN pip install -r /opt/keystone/requirements.txt

# Get keystone source
RUN cd /opt/keystone; git checkout stable/newton && python setup.py install --prefix /usr
RUN mkdir -p /etc/keystone/

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
