<<<<<<< HEAD
###How to
vagrant plugin install vagrant-rekey-ssh
- Copy the id_rsa.pub to local folder for Docker to copy the keys into containers
- make sure the insecure_private_key matches the user's id_rsa file in local environment
- Vagrantfile.macos is the file to be used when using docker in macos. This will create docker containers with private IP and exposing ssh ports (2022, 2033) to localhost 
- Vagrantfile.linux is the file to be used when using docker in ubuntu. This will create docker containers with additional interface with public IP. However the default route in the container needs tweaking


##Troubleshooting: 
when trying to bring up the vagrant docker container, ssh was failing to authenticate: This was due to vagrant by default uses the default private key located in 
~/.vagrant.d/insecure_private_key 
overwrite the content to use the users's privatekey 

###Identify vagrant ssh configuration 
#vagrant ssh-config 
