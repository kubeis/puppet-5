# Manifests 

## Premiers scripts
```shell
puppet config set environment production --section=agent
vim /etc/puppetlabs/code/environments/production/manifests/01.pp 
# add these lines
notify { "Hello 1":
  message => 'Hello 1\n'
}
puppet agent -t 
```

## runinterval Check the interval 
```shell
puppet config print runinterval
expr 1800 / 60  
systemctl status puppet
```

## New environment 
```shell
yum -y install tree
mkdir -p  /etc/puppetlabs/code/environments/dev/manifests
puppet config set environments dev --section=agent    
```

## Alias 
