class parent {
  $value = 'Puppet'
}

class parent::child {
  $value = $parent::value
  alert($value)
}