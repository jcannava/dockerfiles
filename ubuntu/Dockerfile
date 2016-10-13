# Pre-configure and update ubuntu

FROM ubuntu:14.04

# Generate locale files
RUN locale-gen en_US.UTF-8

# Export it
ENV LANG en_US.UTF-8

# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

# Setup
RUN apt-mark hold initscripts udev plymouth mountall
RUN apt-get update
RUN apt-get -y install git-core build-essential python-dev libssl-dev wget
RUN wget -O /opt/get-pip.py https://bootstrap.pypa.io/get-pip.py
RUN /usr/bin/python /opt/get-pip.py
RUN pip install -U pip setuptools
