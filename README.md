#  Training puppet-5

## Pre-requisites on your VM
### Useful packages  
```shell
   sudo apt-get update  # update links to repos
   sudo apt-get -y install git wget htop iotop iftop # install git and monitoring tools
   sudo apt-get -y install python3 python3-venv # install python3 and virtualenv
   sudo apt-get -y install build-essential   # need for installing docker-compose
   sudo apt-get -y install python3-dev libxml2-dev libxslt-dev libffi-dev # need for installing docker-compose
   htop  # check your vm config
   Crtl-c  # exit 
``` 

## install bolt on the puppetmaster 
```shell
wget https://apt.puppet.com/puppet-tools-release-focal.deb
sudo dpkg -i puppet-tools-release-focal.deb
sudo apt-get update 
sudo apt-get install puppet-bolt
```
## Copy this repo 
```shell
git clone  https://github.com/<votre_repo>/puppet-5.git
```

## Create a bolt project
```shell
cd puppet-5 
mkdir project
cd project 
bolt project init
```

## inventory example
Open inventory yaml file
```yaml
 groups:
   - name: remote
     targets:
       - 164.132.182.36
     config:
       transport: ssh
       ssh:
         private-key: ~/.ssh/id_rsa
         user: fedora
   - name: local
     targets: 
       - localhost
     config:
       transport: local
#
```



