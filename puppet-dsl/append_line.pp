include stdlib

file { '/tmp/eureka.txt':
  ensure => present,
}->
file_line { 'Append a line to /tmp/eureka.txt':
    path => '/tmp/eureka.txt',
    line => 'Hello World',
}