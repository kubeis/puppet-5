if ($users['hme']['shell'] == '/bin/bash'){
  user {'hme':
    ensure => present,
    shell => '/bin/bash',
  }
}