#!/bin/bash

sudo iptables -F
sudo service iptables save
sudo service ipatbles restart
sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
sudo yum -y install puppet
[ -f /vagrant/puppetagent.conf ] && cp /vagrant/puppetagent.conf /etc/puppet/puppet.conf
sudo echo "192.168.0.10	puppet" >> /etc/hosts
sudo puppet agent --test || test $? -eq 2
