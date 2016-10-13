# OpenStack heat 0.2

FROM openstack:ubuntu

# Set correct environment variables.
ENV HOME /opt/heat

# Set release
ENV RELEASE stable/newton

# Get heat source
RUN git clone https://github.com/openstack/heat -b $RELEASE $HOME
RUN pip install -r $HOME/requirements.txt
RUN cd $HOME; git checkout $RELEASE && python setup.py install
RUN mkdir -p /etc/heat/

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
