# PDK

## Configure
```shell
sudo -s
yum list --disablerepo=* --enablerepo=puppet available
yum install -y pdk
cd /home/centos/puppet-5
pdk new module hme-ntp
cd ntp
pdk new class ntp
#edit ntp_spec.rb
# add it { is_expected.to contain_service('ntp') }
pdk test unit
```

## Edit init.pp - Add lines
```puppet
class ntp {
  service { 'ntp' :
   ensure => 'running',
   enable => true,
  }
}
```  
## Test on dedicated version 
```shell
pdk test unit --puppet-version 5.5
```
