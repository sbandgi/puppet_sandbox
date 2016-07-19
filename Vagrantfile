# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

servers = {
  "puppet" => {
    name: "puppet",
    box: "puppetlabs/centos-6.6-64-nocm",
    ip: "192.168.0.10",
    ram: 2536,
    script: 'install_puppetserver.sh',
    #hostport: 80,
    #guestport: 80
  },
  "agent1" => {
    name: "server1",
    box: "puppetlabs/centos-6.6-64-nocm",
    ip: "192.168.0.11",
    ram: 512,
    script: 'install_puppetagent.sh'
  }
  #"app2" => {
  #  name: "appserver2",
  #  box: "nrel/CentOS-6.5-x86_64",
  #  ip: "192.168.0.12",
  #  ram: 512
  #}
}

Vagrant.configure("2") do |config|
  servers.each do |server, attr|
    config.vm.define server do |srv|
      srv.vm.box = attr[:box]
      srv.vm.hostname = attr[:name]
      srv.vm.network "private_network", ip: attr[:ip]
      srv.vm.provider :virtualbox do |vb|
        vb.name = attr[:name]
        vb.memory = attr[:ram]
      end
      srv.vm.provision "shell" do |shell|
        shell.path = attr[:script]
      end
      #srv.vm.provision "puppet" do |puppet|
      #  puppet.module_path = "puppet/modules"
      #  puppet.options = "-l /tmp/manifest.log"
      #end
      if defined?(attr[:guestport]) && (attr[:hostport]) then
        srv.vm.network "forwarded_port", guest: attr[:guestport], host: attr[:hostport]
      end
    end
  end
end
