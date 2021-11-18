# Puppet on Centos8

## Install repo package 
```shell
sudo yum update
sudo yum install https://yum.puppet.com/puppet-release-el-8.noarch.rpm
sudo yum list --disablerepo=* --enablerepo=puppet available  
```

## Install Server and Agent 
```shell
sudo -s
echo "127.0.0.2 puppet" >> /etc/hosts
yum -y install puppetserver  # install puppetserver and agent as well
exit ; sudo -i puppet --version 
```

## Time synchronize 
```shell
sudo -s
puppet apply -e 'package { "chrony": ensure => installed } ' # is the package chrony installed ?  
puppet apply -e 'service { "chronyd": ensure => running, enable => true } ' # start the time service 
#puppet apply -e 'include ::timezone class { '::timezone': timezone => 'Etc/UTC', package_ensure => 'present', manage_package => true, }'
```

## Change puppetserver java memory settings
```shell
sed -i 's/2g/1g/g' /etc/sysconfig/puppetserver  # replace 2g by 1g globally in the script
systemctl enable --now puppetserver puppet #  enable services 
ss -ntl  # socker status ,check if the 8140 port is opened
puppet agent -t  # test
```


