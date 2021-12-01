# Puppet on Centos8

## Install repo package 
```shell
sudo yum -y update # update all packages
sudo yum -y install https://yum.puppet.com/puppet-release-el-8.noarch.rpm # install puppet repo package
sudo yum list --disablerepo=* --enablerepo=puppet available  
```

## Install Server and Agent 
```shell
sudo -s
echo "127.0.0.2 puppet" >> /etc/hosts
yum -y install puppetserver  # install puppetserver and agent as well
exit ; sudo -i puppet --version 
```

## Generate a CA 
```shell
puppetserver ca list -a # list all current certificats
puppet agent --test --noop --certname puppet # no op or dry-run
puppetserver ca list -a  # check 
puppetserver ca sign --certname puppet  # sign a named certificat

```




## Time synchronize 
```shell
sudo -s
puppet apply -e 'package { "chrony": ensure => installed }' # is the package chrony installed ?  
puppet apply -e 'service { "chronyd": ensure => running, enable => true }' # start the time service 
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
ss -ntl  # see ports in used 
ss -ntlp # see processes in used 
curl https:<vm_ip> # check
```

## Set up 
```shell
yum install epel-release
yum repolist
yum list puppet
```

## Environment and manifest 
```shell
puppet config print 
puppet config print config
puppet config print manifest --section master --environment production
# puppet apply -e or puppet agent -t 
vi /etc/puppetlabs/code/environments/production/manifests/site.pp
```
add code   
```puppet
notify { 'Hello world':
  message => "Hello world",
}
puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp
puppet agent -t
```
Set up a custom environment  
```shell
mkdir -p /etc/puppetlabs/code/environments/dev/manifests 
puppet config set environment dev --section=agent
```

## Bash Aliases
```shell
alias cdpp='cd $(puppet config print manifest)'
alias
```


## Resources (notify, package, service)
```shell
puppet resource --type
puppet describe service
puppet resource service chronyd 
```