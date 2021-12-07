case $facts['os']['family'] {
  'RedHat': {
    package {'git':
      provider => 'yum',

    }
  }
  'Debian': {
    package {'git':
      provider => 'apt',
    }
  }
}