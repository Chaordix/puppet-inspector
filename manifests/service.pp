# Ensure inspector service is running.
class inspector::service inherits inspector {
  case $::operatingsystem {
    'Ubuntu': {
      service { 'amazon-inspector-agent':
        ensure  => 'running',
        require => Class['inspector::install'],
      }
    }
    default: { fail("The ${module_name} module is not supported on ${::osfamily}/${::operatingsystem}.") }
  }
}
