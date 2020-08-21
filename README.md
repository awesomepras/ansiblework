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
* Vagrantfile.linux uses network interface wlnps0 which is found in ubuntu, edit the file and separate the distro before doing vagrant up
Troubleshooting:
For some reason the insecure key got corrupted remove it from ~/.vagrant.d/insecure_private_key and when vagrant up command is issued a new key will be re-generated
https://github.com/roots/trellis/issues/46 \#
```Your SO thread mentioned that you tried replacing the contents of insecure_private_key with contents from ~/.ssh/id_rsa. Maybe something got messed up in the process of changing insecure_private_key back to its original value. You could just delete the insecure_private_key file -- vagrant should create a new one on the next vagrant up.```

Debug Vagrant log:
vagrant up --debug &> vagrant.log
