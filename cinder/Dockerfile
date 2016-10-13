# OpenStack cinder 0.2

FROM openstack:ubuntu

# Set correct environment variables.
ENV HOME /opt/cinder

# Set release
ENV RELEASE stable/newton

# Get cinder source
RUN git clone https://github.com/openstack/cinder -b $RELEASE $HOME
RUN pip install -r $HOME/requirements.txt
RUN cd $HOME; git checkout $RELEASE && python setup.py install
RUN mkdir -p /etc/cinder/

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
