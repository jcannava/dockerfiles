# OpenStack Keystone 0.2

FROM openstack:ubuntu

# Set correct environment variables.
ENV HOME /opt/keystone

# Set release
ENV RELEASE stable/newton

# Build keystone source
RUN git clone https://git.openstack.org/openstack/keystone -b $RELEASE $HOME
RUN pip install -r $HOME/requirements.txt
RUN cd $HOME; git checkout $RELEASE && python setup.py install --prefix /usr
RUN mkdir -p /etc/keystone/

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
