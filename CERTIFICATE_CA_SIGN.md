# How to manage certificats
```shell
puppet resource service puppet ensure=stopped
puppet resource service puppetserver ensure=stopped
cd /etc/puppetlabs/puppetserver
rm -Rf ca 

puppet resource service puppet ensure=running
puppetserver ca setup
puppet resource service puppet ensure=stopped
puppet resource service puppet ensure=running
puppetserver ca list
# go to the node
puppetserver ca list
puppetserver ca sign -a
```

## On the node 
```shell
cd /etc/puppetlabs/puppet
puppet resource service puppet ensure=stopped
rm -Rf ssl
puppet resource service puppet ensure=running
cd ssl
ll
puppet agent -t
# run on puppetmaster 
puppetserver ca sign -a
# back to the node 
puppet agent -t
```