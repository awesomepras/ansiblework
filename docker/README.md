vagrant plugin install vagrant-rekey-ssh 

Copy the id_rsa.pub to local folders (master) 

make sure the insecure_private_key matches the user's id_rsa file in local environment 

##Troubleshooting: 
when trying to bring up the vagrant docker container, ssh was failing to authenticate: This was due to vagrant by default uses the default private key located in 
~/.vagrant.d/insecure_private_key 
overwrite the content to use the users's privatekey 

###Identify vagrant ssh configuration 
#vagrant ssh-config 
