group { 'examplegroup':
   ensure => 'present',
}

user {'alice':
  ensure => 'present',
  gid => 'examplegroup',
  managehome => 'true',
}

