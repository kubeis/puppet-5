include stdlib

file { '/tmp/text.txt':
  ensure => present,
}->
file_line { 'add text after aaa to /tmp/text.txt':
    path => '/tmp/text.txt',
    line => 'add text',
    after => 'aaa',
}