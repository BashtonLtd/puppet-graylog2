# == Class graylog2::params
#
# This class is meant to be called from graylog2
# It sets variables according to platform
#
class graylog2::params {
  case $::osfamily {
    'RedHat', 'Amazon': {
      $server_package_name = 'graylog2-server'
      $server_service_name = 'graylog2-server'
      $server_config_file  = '/etc/graylog2/graylog2.conf'
      $web_package_name    = 'graylog2-web-interface'
      $web_service_name    = 'graylog2-web-interface'
      $web_config_file     = '/opt/graylog2-web-interface/conf/graylog2-web-interface.conf'
    }
    default: {
      fail("${::operatingsystem} not supported")
      # But pull requests are gratefully accepted.. :)
    }
  }
}
