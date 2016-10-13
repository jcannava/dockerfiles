# OpenStack cinder 0.2

FROM ubuntu:14.04

# Set correct environment variables.
ENV HOME /opt/cinder

# Set release
ENV RELEASE stable/newton

# Generate locale files
RUN locale-gen en_US.UTF-8

# Export it
ENV LANG en_US.UTF-8

# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

# Setup for cinder
RUN apt-mark hold initscripts udev plymouth mountall
RUN apt-get update
RUN apt-get -y install git-core python-setuptools build-essential python-dev libssl-dev
RUN easy_install --upgrade pip

# Get cinder source
RUN git clone https://github.com/openstack/cinder -b $RELEASE $HOME
RUN pip install -r $HOME/requirements.txt
RUN cd $HOME; git checkout $RELEASE && python setup.py install
RUN mkdir -p /etc/cinder/

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
