# Ensure inspector service is running.
class inspector::service inherits inspector {
  case $::operatingsystem {
    'Ubuntu': {
      service { 'awsagent':
        ensure => running,
        name   => 'awsagent',
      }
    'CentOS': {
      service { 'awsagent':
        ensure => running,
        name   => 'awsagent',
      }
    }
    default: { fail("The ${module_name} module is not supported on ${::osfamily}/${::operatingsystem}.") }
  }
}

