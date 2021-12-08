# PuppetDB 

## Install on a dedicated node 
```shell
sudo -s
dnf update
dnf module list postgresql
dnf module -y enable postgresql:13
dnf install -y  postgresql-server, postgresql-contrib
postgresql-setup --initdb
systemctl start postgresql
systemctl enable postgresql
lsof
dnf install -y  lsof  # install package
lsof -i :5432  # check whether postgres is up and running

```
## Database configuration
```shell
sudo -iu postgres
createuser -DRSP puppetdb
createdb -E UTF8 -O puppetdb puppetdb

cd /var/lib/pgsql/data
vi pg_hba.conf
# add line
local  puppetdb         puppetdb                                md5
host   puppetdb         puppetdb       127.0.0.1/32             md5
host   puppetdb         puppetdb       ::1/128                  md5
# Check
exit
systemctl restart postgresql
sudo -iu postgres
psql -h localhost puppetdb puppetdb
# password
\q 
 
```

## install puppetdb
```shell
sudo yum -y update # update all packages
sudo yum -y install https://yum.puppet.com/puppet-release-el-8.noarch.rpm # install puppet repo package
sudo yum list --disablerepo=* --enablerepo=puppet available # check 
yum -y install  puppetdb # install puppetdb
puppetdb ssl-setup  # generate ssl certificats
```

