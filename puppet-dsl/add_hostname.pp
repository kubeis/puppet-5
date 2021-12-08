$ip = $::domain ? {
    /production/ => '10.10.10.10',
    /staging/ => '192.168.23.10',
    default   => '10.100.100.100',
}

host {'test':
  ip => $ip,
}