# OpenStack neutron 0.2

FROM openstack:ubuntu

# Set correct environment variables.
ENV HOME /opt/neutron

# Set release
ENV RELEASE stable/newton

# Get neutron source
RUN git clone https://github.com/openstack/neutron -b $RELEASE $HOME
RUN pip install -r $HOME/requirements.txt
RUN cd $HOME; git checkout $RELEASE && python setup.py install
RUN mkdir -p /etc/neutron/

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
