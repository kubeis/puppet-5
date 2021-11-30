# Git and r10k 

## install 
```shell
dnf install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel
yum --enablerepo=powertools install -y libyaml-devel libffi-devel
curl -sL https://rpm.nodesource.com/setup_12.x | bash -
dnf install -y nodejs
node -v
curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
dnf install -y yarn
```

# install ruby
```shell
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install $(rbenv install -l | grep -v - | tail -1)
ruby -v
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
rbenv global 3.0.3 && rbenv rehash
```

## Run it 
```shell
r10k 
mkdir -p /etc/puppetlabs/r10k
vi /etc/puppetlabs/r10k/r10k.yaml
```
example of r10k.yaml
```yaml
---
:sources:
  :control: 
    remote: 'https://github.com/kubeis/puppet-r10k.git'
    basedir: '/etc/puppetlabs/code/environments'
    prefix: false
  :ctl:
    remote: 'https://github.com/kubeis/puppet-r10k.git'
    basedir: '/etc/puppetlabs/code/environments'
    prefix: true
```

## Test 
```shell
cd /etc/puppetlabs/code/environments
rm -Rf *
r10k deploy environment
ls
puppet agent -t --environment ctl_main 
```

## Puppetfile 
```shell
cd /etc/puppetlabs/code/environments/production 
vi Puppetfile
# add these line
mod 'puppetlabs/ntp'
mod 'puppetlabs/stdlib'
git push origin HEAD:production
r10k deploy environment -p ctl_production
```