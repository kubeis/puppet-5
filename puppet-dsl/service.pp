# verifier si le service fonctionne
service { 'cron':
  ensure => 'running',
}

# demarre au boot
service { 'cron':
  enable => true,
}

#  arret du service
service { 'cron':
  ensure => 'stopped',
}

file { '/etc/chrony.conf':
  notify => Service['chrony'],

}



