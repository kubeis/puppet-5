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
```

## Change puppetserver java memory settings
```shell
sed -i 's/2g/1g/g' /etc/sysconfig/puppetserver  # replace 2g by 1g globally in the script
systemctl enable --now puppetserver puppet #  enable services 
ss -ntl  # sockets status ,check whether the 8140 port is opened
puppet agent -t  # test
```

## First usage
```shell
puppet module install puppetlabs/apache
puppet apply -e "include apache"
ss -ntl
ss -ntlp 
curl https:<vm_ip>
```

## Set up 
```shell
yum install epel-release
yum repolist
yum list puppet
```

## Environment 
```shell
puppet config print 
mkdir -p /etc/puppetlabs/code/environments/dev/manifests 
puppet config set environment dev --section=agent
```

## Resources
```shell
puppet resource --type
puppet describe service
puppet resource service chronyd 

```