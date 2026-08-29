# -*- mode: ruby -*-
# vi: set ft=ruby :

machines = {
  "master" => {
    "memory" => 1024,
    "cpus" => 1,
    "ip" => "10.10.10.100"
  },
  "node01" => {
    "memory" => 1024,
    "cpus" => 1,
    "ip" => "10.10.10.101"
  },
  "node02" => {
    "memory" => 1024,
    "cpus" => 1,
    "ip" => "10.10.10.102"
  },
  "node03" => {
    "memory" => 1024,
    "cpus" => 1,
    "ip" => "10.10.10.103"
  }
}

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"

  machines.each do |name, settings|
    config.vm.define name do |machine|
      machine.vm.hostname = name
      machine.vm.network "private_network", ip: settings["ip"]

      machine.vm.provider "virtualbox" do |vb|
        vb.name = name
        vb.memory = settings["memory"]
        vb.cpus = settings["cpus"]
      end

      machine.vm.provision "shell", path: "docker.sh"

      if name == "master"
        machine.vm.provision "shell", path: "master.sh"
      else
        machine.vm.provision "shell", path: "worker.sh"
      end
    end
  end
end
