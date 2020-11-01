# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
 config.vm.box = "centos/7"
    config.vm.define "server" do |server|
        server.vm.hostname = "server.loc"
        server.vm.network "private_network", ip: "192.168.10.10"
        config.vm.provision "shell", path: "server.sh"
    end
    config.vm.define "client" do |client|
        client.vm.hostname = "client.loc"
        client.vm.network "private_network", ip: "192.168.10.20"
        config.vm.provision "shell", path: "client.sh"
    end
end