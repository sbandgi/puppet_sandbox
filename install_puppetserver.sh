#!/bin/bash

sudo iptables -F
sudo service iptables save
sudo service ipatbles restart
sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
if [ $? -ne 0 ]; then exit 1; fi
sudo yum -y install puppetserver
if [ $? -ne 0 ]; then exit 1; fi
[ -d /vagrant/modules ] && cp -r /vagrant/modules /etc/puppet/
[ -d /vagrant/manifests ] && cp -r /vagrant/manifests /etc/puppet/
sudo echo "*" > /etc/puppet/autosign.conf
[ -f /vagrant/puppetserver.conf ] && cp /vagrant/puppetserver.conf /etc/puppet/puppet.conf
sudo echo "192.168.0.10	puppet" >> /etc/hosts
sudo service puppetserver start
if [ $? -ne 0 ]; then exit 1; fi
sudo puppet agent --test || test $? -eq 2
