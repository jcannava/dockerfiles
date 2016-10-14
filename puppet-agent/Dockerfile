#  Puppet agent

FROM openstack:ubuntu

RUN apt-get update && apt-get install -y ntp wget
RUN wget -O /opt/puppetlabs-release-trusty.deb https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
RUN dpkg -i /opt/puppetlabs-release-trusty.deb
RUN apt-get update && apt-get install --no-install-recommends -y puppet-agent

ENV PATH=/opt/puppetlabs/server/bin:/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:$PATH

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
