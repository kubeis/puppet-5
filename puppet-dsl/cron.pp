cron { 'toutes les 5 minutes':
  command => '',
  minute => range(0,55,5),
}

$range = range('0','2')
$prefixed = prefix($range,'/tmp/test')
$complete = suffix($prefixed, '.txt')


