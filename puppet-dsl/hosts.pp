host {'dashboard':
  ip => '10.10.10.1',
  host_aliases => ['nagios','munin'],
}