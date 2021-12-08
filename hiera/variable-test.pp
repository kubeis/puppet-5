file { "/tmp/my_value.txt":
   ensure => file,
   content => lookup("value", String),
}