Vagrant.configure("2") do |config|
  config.vm.box = "centos/8"
  config.vm.box_version = "1905.1"
  config.vm.box_check_update = false
  config.vm.hostname = "centos8"
  config.vm.provider "virtualbox" do |vb|
  # Display the VirtualBox GUI when booting the machine
     vb.gui = false
     vb.memory = "2048"
     vb.cpus = 2
     vb.name = "centos8"
  end
  config.vm.define "centos8" #change default vagrantbox name to guestname
  #end
end
