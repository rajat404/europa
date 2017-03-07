# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "europabox"
  config.vm.network "private_network", ip: "10.0.0.10"
  config.vm.synced_folder ".", "/srv/europa", owner: "vagrant", group: "vagrant"

  forward_port = ->(guest, host = guest) do
    config.vm.network :forwarded_port,
      guest: guest,
      host: host,
      auto_correct: true
  end

  forward_port[8000, 8001]
  forward_port[8888, 9999]

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.provision :shell, :path => "provision.sh"
end
