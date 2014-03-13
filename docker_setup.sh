#!/bin/bash

# Install lxc etc..
sudo apt-get install linux-image-generic-lts-raring linux-headers-generic-lts-raring curl git-core build-essential

# Install docker
curl -s https://get.docker.io/ubuntu/ | sudo sh
