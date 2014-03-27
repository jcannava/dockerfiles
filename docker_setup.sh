#!/bin/bash

# Install lxc etc..
sudo apt-get install linux-image-generic-lts-raring linux-headers-generic-lts-raring curl git-core build-essential

# Install docker
curl -s https://get.docker.io/ubuntu/ | sudo sh

# Clone DockerFiles
git clone https://github.com/jcannava/dockerfiles

# Build Services
# Keystone
cd dockerfiles/keystone
docker build -t keystone .
docker run -d -P keystone
