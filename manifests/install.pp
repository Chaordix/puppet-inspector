# Install the inspector package
class inspector::install inherits inspector {
  case $::operatingsystem {
    'Ubuntu': {
      exec { 'download_inspector-agent':
        command => "/usr/bin/wget -N https://d1wk0tztpsntt1.cloudfront.net/linux/latest/install -O /opt/inspector-install.sh",
        path    => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
        creates => '/opt/inspector-install.sh',
      } ~>
      file { '/opt/inspector-install.sh':
        mode => '0755',
      } ~>
      exec { 'install_inspector-agent':
        command => '/opt/inspector-install.sh',
        path    => '/sbin:/bin:/usr/bin:/usr/local/bin:/usr/sbin',
        refreshonly => true,
      }
    }
    default: { fail("The ${module_name} module is not supported on ${::osfamily}/${::operatingsystem}.") }
  }
}

