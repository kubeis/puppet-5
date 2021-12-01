
notify { 'memory size':
  message => $facts['memory']['system']['total'],
}