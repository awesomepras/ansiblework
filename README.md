# ansiblework
This repo will hold info on how i setup my lab environment and worked through stuff for ansible learning

Steps:
* Download and install VirtualBox  
https://www.virtualbox.org/wiki/Downloads  
Note: Virtualbox is the only supported hyper-visor at this time.  
* Download and Install Vagrant  
https://www.vagrantup.com/downloads.html  
Open a terminal/command prompt and install Vagrant Plugins (NOTE: you may need to run these with sudo on Mac OS X)  
* vagrant plugin install vagrant-vbguest \#The vbguest plugin manages VirtualBox Guest Additions (a set of device drivers and system applications which are installed in the guest operating system).  

* vagrant plugin install vagrant-hostmanager\# The host manager plugin will allow our VM's to communicate with each other and host machine by name.
