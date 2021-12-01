include stdlib

file { '/tmp/eureka.txt':
  ensure => present,
}->
file_line { 'Replace a line to /tmp/eureka.txt':
    path => '/tmp/eureka.txt',
    line => 'Hello Eureka',
    match => '^Hello.*$',
}