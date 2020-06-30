#This Vagrant file will create few docker containers 
# -*- mode: ruby -*-
# vi: set ft=ruby :
ENV['VAGRANT_NO_PARALLEL'] = 'yes'
Vagrant.configure("2") do |config|
  config.ssh.forward_agent = true
  config.vm.define "master", primary: true do |master|
    master.vm.network :private_network, type: "dhcp"
    master.vm.network :private_network, ip: "192.168.0.120"
    master.vm.network "forwarded_port", guest: 22, host: 2022, id: "ssh",
    auto_correct: true
    master.vm.hostname = "master"
      config.vm.provider "docker" do |d|
                                                #allow use of ssh key from host, make sure to copy the id_rsa to vagrant insecure_private_key file
        d.has_ssh = true
                                                # will look for Dockerfile in same file loc as vagrantfile
        d.build_dir = "master/."
        d.name = "master"
        d.build_args = ['--rm-true', '--tag=test/ubuntu:18.04']
        d.create_args = ['--rm=true']         # Avoid leaving unused containers behind.
      end
  end
  config.trigger.after :up do |trigger|
    trigger.info = "More information"
    trigger.run = {inline: "bash -c 'echo \"hey there!!\" > file.txt'"}
  end

#Guest 2
  config.vm.define "slave" do |slave|
#    slave.vm.network :private_network, type: "dhcp", docker_network__internal: true
    slave.vm.network "forwarded_port", guest: 22, host: 2033, id: "ssh",
    auto_correct: true
    slave.vm.hostname = "slave"
      config.vm.provider "docker" do |d|
        d.has_ssh = true
        d.build_dir = "slave/."
        d.name = "slave"
      end
  end
end

#for some reason the following doesnt work
# vagrant up master 
# the above command creates a docker container with --name = slave
# networking is not setting static ip
