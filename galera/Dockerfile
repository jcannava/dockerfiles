# MariaDB galera

FROM ubuntu:14.04

# Generate locale files
RUN locale-gen en_US.UTF-8

# Export it
ENV LANG en_US.UTF-8

# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

# Setup for galera/mariadb
RUN apt-mark hold initscripts udev plymouth mountall
RUN apt-get update
RUN apt-get install -y python-software-properties software-properties-common
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 BC19DDBA
RUN add-apt-repository 'deb http://releases.galeracluster.com/ubuntu trusty main'
RUN apt-get update
RUN apt-get install -y galera-3 galera-arbitrator-3 mysql-wsrep-5.6 rsync lsof

# Bootstrap MariaDB
RUN service mysql bootstrap

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
