#  Training puppet-5

## Pre-requisites on your VM
### Useful packages  
```shell
   sudo apt-get update  # update links to repos
   sudo apt-get -y install git wget htop iotop iftop # install git and monitoring tools
   sudo apt-get -y install python3 python3-venv # install python3 and virtualenv
   sudo apt-get -y install build-essential   # need for installing docker-compose
   sudo apt-get -y install python3-dev libxml2-dev libxslt-dev libffi-dev # need for installing docker-compose
   htop # check your vm config
   Crtl-c  # exit 
``` 

## Set correct timezone
```shell
sudo timedatectl set-timezone Europe/Paris
date
sudo systemctl restart cron
sudo systemctl restart rsyslog
sudo systemctl status rsyslog
```

## Set /etc/hosts on both master and node 
```
sudo vi /etc/hosts
137.74.107.159   ref-master
137.74.85.233    node1
# save and check 
ping -c3 node1 

```

## Install bolt on ubuntu  (host puppetmaster)  
```shell
wget https://apt.puppet.com/puppet-tools-release-focal.deb
sudo dpkg -i puppet-tools-release-focal.deb
sudo apt-get update 
sudo apt-get install puppet-bolt
```

## Install bolt on fedora 32 ( host puppetmaster )
```shell
sudo rpm -Uvh https://yum.puppet.com/puppet-tools-release-fedora-33.noarch.rpm
sudo dnf install puppet-bolt
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

## Inventory example
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
bolt command run whoami -t all
```

# Configure puppet master 
```shell
sudo apt update
curl -O https://apt.puppet.com/puppet-release-focal.deb
sudo apt install ./puppet-release-focal.deb 
sudo apt update
sudo apt -y install puppetserver
apt policy puppetserver
sudo systemctl start puppetserver
sudo systemctl enable puppetserver
systemctl status puppetserver
# change .profile   vi ~/.profile 
export PATH=/opt/puppetlabs/bin/:$PATH
source .profile
puppet --version   # should be version 7.8+
```
# Configure puppet client
```shell
# set a FQDN name in /etc/hosts
sudo apt update
wget https://apt.puppet.com/puppet7-release-focal.deb
sudo dpkg -i puppet7-release-focal.deb
sudo apt update
sudo apt-get install puppet-agent
# change the host name in /etc/hosts and this file /etc/puppetlabs/puppet/puppet.conf
# accordingly
# in /etc/hosts
127.0.0.1 localhost
137.74.85.233 ref-node1 ref-node1 external.local
137.74.107.159  ref-master.openstacklocal
172.20.14.135 internal.local
# in /etc/puppetlabs/puppet/puppet.conf
[main]
server = ref-master.openstacklocal
# This file can be used to override the default puppet settings.
sudo systemctl stop puppet 
sudo systemctl start puppet
sudo systemctl status puppet  
# No error should be displayed 
sudo -i
puppet ssl bootstrap
puppet config print | grep runinterval
puppet config set --section main runinterval 30
sudo systemctl stop puppet 
sudo systemctl start puppet
sudo systemctl status puppet 


```
## Sign the certificate on the master 
```shell
sudo /opt/puppetlabs/server/bin/puppetserver ca list
# you get the certificate name 
sudo /opt/puppetlabs/server/bin/puppetserver ca sign --certname <certificate name> 
sudo vi /etc/puppetlabs/code/environments/production/manifests/file_hello.pp
# add code 
file { '/tmp/hello.txt' :
       ensure => file,
       content => "hello, world\n",
}
```
