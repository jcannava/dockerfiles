#  Puppet master

FROM openstack:ubuntu

# Install Dependencies
RUN apt-get update && apt-get -y install ntp wget

# Install Puppet Master
RUN wget -O /opt/puppetlabs-release-trusty.deb https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
RUN dpkg -i /opt/puppetlabs-release-trusty.deb
RUN apt-get -y install puppetmaster-passenger
RUN rm -rf /var/lib/puppet.ssl
ADD puppet.conf /etc/puppet/puppet.conf
RUN puppet master --verbose
ADD puppet_apache2.conf /etc/apache2/sites-enabled/puppetmaster.conf

# (TODO) Need to build an actual site.pp..
RUN touch /etc/puppet/manifests/site.pp

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
