node 'puppetnode-teacher.novalocal' {
  file { '/tmp/myfile.txt':
    content => "Hello",
    owner => root,
    mode => 775,
  }
}
node default {
  notify { 'Default ':
  }
}