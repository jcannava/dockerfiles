#!/bin/bash

# Install lxc etc..
sudo apt-get install linux-image-generic-lts-raring linux-headers-generic-lts-raring curl git-core build-essential

# Install docker
curl -s https://get.docker.io/ubuntu/ | sudo sh

# Build Services

# Keystone
cd dockerfiles/keystone
docker build -t keystone .
docker run -d -P keystone

# Glance
cd ../glance
docker build -t glance .
docker run -d -P glance

