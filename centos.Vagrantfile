Vagrant.configure("2") do |config|
  config.ssh.private_key_path = [ '~/.vagrant.d/insecure_private_key','~/.ssh/id_rsa' ] 
  config.ssh.forward_agent = true
  config.ssh.insert_key = false
  config.vm.box = "centos/8"
  config.vm.box_version = "1905.1"
  config.vm.box_check_update = false
  config.vm.network :public_network, type: "dhcp", bridge: "en0: Wi-Fi (Wireless)", ip: "192.168.0.130"
  config.vm.network "forwarded_port", guest: 22, host: 20022, id: "ssh"
  config.vm.define "centos8" 
  config.vm.provider "virtualbox" do |vb|
  # Display the VirtualBox GUI when booting the machine
     vb.gui = false
     vb.memory = "2048"
     vb.cpus = 2
     vb.name = "centos"
  end
#change default vagrantbox name to guestname
  config.vm.define "centos8" do |co|
   co.vm.hostname = "centos8"
   co.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"
   co.vm.provision "shell", inline: <<-SHELL
     sudo yum -y install wget
   SHELL
  end
end
