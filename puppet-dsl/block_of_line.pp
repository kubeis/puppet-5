include stdlib

$text = @("TEXT"/L)
  [user]
     name = ${displayname}
     email = ${email}
  [color]
     ui = true
  [alias]
     lg = log
  [merge]
     defaultToUpstream = true
  [push]
     default = upstream
  | TEXT

file { '/tmp/block.txt':
  ensure => file,
  content => $text,
}