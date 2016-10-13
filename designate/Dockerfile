# OpenStack designate 0.2

FROM openstack:ubuntu

# Set correct environment variables.
ENV HOME /opt/designate

# Set release
ENV RELEASE stable/newton

# Get designate source
RUN git clone https://github.com/openstack/designate -b $RELEASE $HOME
RUN pip install -r $HOME/requirements.txt
RUN cd $HOME; git checkout $RELEASE && python setup.py install
RUN mkdir -p /etc/designate/

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
