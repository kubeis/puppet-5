file { '/tmp/link-to-motd':
  ensure => 'link',
  target => '/etc/motd',
}

file { ['/usr/local/test/','/usr/local/test/2.0']:
  ensure => 'directory',
}