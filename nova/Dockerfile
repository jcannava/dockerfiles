# OpenStack nova 0.2

FROM openstack:ubuntu

# Set correct environment variables.
ENV HOME /opt/nova

# Set release
ENV RELEASE stable/newton

# Get nova source
RUN git clone https://github.com/openstack/nova -b $RELEASE $HOME
RUN pip install -r $HOME/requirements.txt
RUN cd $HOME; git checkout $RELEASE && python setup.py install
RUN mkdir -p /etc/nova/

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
