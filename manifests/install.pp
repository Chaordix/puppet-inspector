# Install the inspector package
class inspector::install inherits inspector {
  case $::operatingsystem {
    'Ubuntu': {
      exec { 'download_inspector-agent':
        command => "/usr/bin/wget -N https://d1wk0tztpsntt1.cloudfront.net/linux/latest/install -O /opt/inspector-install.sh",
        path    => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
        creates => '/opt/inspector-install.sh',
      } ~>
      exec { 'install_inspector-agent':
        command => 'bash /opt/inspector-install.sh',
        path    => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
      }
    }
    default: { fail("The ${module_name} module is not supported on ${::osfamily}/${::operatingsystem}.") }
  }
}

