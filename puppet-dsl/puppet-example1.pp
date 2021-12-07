

package{['rubygems', 'ruby-devel','libxml2-devel']:}

package{"bundler":
  provider => gem,
  require => Package["rubygems"],
}

file { '/opt/webapps':
  ensure => directory,
}

exec {'fetch webapp repo':
  command => "git clone  https://github.com/kubeis/puppet-5.git",
  path => "/usr/bin/:/usr/local/bin/:/bin/" ,
  creates =>'/opt/webapps/rails',
}
