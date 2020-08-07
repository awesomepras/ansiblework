pub_key = `ssh-keygen -y -e -f '/Users/s1120391/.ssh/id_rsa'`
$script =<<-EOC
echo '${pub_key}' >> /home/vagrant/.ssh/authorized_keys
sed --in-place=.bak -r 's/^#?(PermitRootLogin|PermitEmptyPasswords|PasswordAuthentication|X11Forwarding) yes/\1 no/' /etc/ssh/sshd_config
sed --in-place=.bak '/== vagrant insecure public key$/d' /home/vagrant/.ssh/authorized_keys
sed --in-place=.bak '$!N; /^\(.*\)\n\1$/!P; D' /home/vagrant/.ssh/authorized_keys
sudo service ssh restart
EOC

Vagrant.configure("2") do |config|
  config.ssh.private_key_path = [ '~/.vagrant.d/insecure_private_key',
                                        '~/.ssh/id_rsa' ] 
  config.ssh.forward_agent = true
  config.ssh.insert_key = false
  config.vm.box = "centos/8"
  config.vm.box_version = "1905.1"
  config.vm.box_check_update = false
  config.vm.hostname = "centos8"
#  config.vm.network "public_network", bridge: "en0", 
#    use_dhcp_assigned_default_route: true
  config.vm.network :public_network, type: "dhcp", bridge: "en0: Wi-Fi (Wireless)"
  config.vm.network "forwarded_port", guest: 22, host: 20022, id: "ssh"
  config.vm.provider "virtualbox" do |vb|
  # Display the VirtualBox GUI when booting the machine
     vb.gui = false
     vb.memory = "2048"
     vb.cpus = 2
     vb.name = "centos"
  end
  config.vm.define "centos" #change default vagrantbox name to guestname
  config.vm.provision "shell", inline: $script,
    run: "always"
end

