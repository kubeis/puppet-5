# Modules

## Premiers scripts
```shell
puppet module list
puppet module install puppetlabs/stdlib
puppet module uninstall puppetlabs/stdlib
# disponible pour tous les environnements
puppet module install -i /etc/puppetlabs/code/modules puppetlabs/stdlib
# obtenir des informations a partir des modules
cat /etc/puppetlabs/code/modules/stdlib/examples/file_line.pp
```

## Run the example 
```shell
cp /etc/puppetlabs/code/modules/stdlib/examples/file_line.pp ~
cd ~
puppet apply file_line.pp
```

## Create a module
```shell
cd /etc/puppetlabs/code/environments/production/modules
mkdir modules
mkdir -p chrony/{manifests,files,examples}
tree chrony
```
### Creating the manifest
```shell
## Top file should be named init.pp
vi chrony/manifests/init.pp
```

```puppet
class chrony { 
  package { 'chrony':
    ensure => 'installed',
  }
  service { 'chronyd':
    ensure => 'running',
    enable => true, 
    require => Package['chrony'],
  }
  file { '/etc/chrony.conf' :
    ensure => file,
    content => file('chrony/chrony.conf'),
    notify => Service['chronyd'],
  }
}
# run this line outside, clean the config file
grep -vE '^(#|$)' /etc/chrony.conf \
> /etc/puppetlabs/code/environments/production/modules/chrony/files/chrony.conf


puppet agent -t
rm /etc/chrony.conf
puppet agent -t
```
