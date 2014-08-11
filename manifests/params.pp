# == Class graylog2::params
#
# This class is meant to be called from graylog2
# It sets variables according to platform
#
class graylog2::params {
  case $::osfamily {
    'RedHat', 'Amazon': {
      $es_repo_version       = '0.90'
      $server_package_name   = 'graylog2-server'
      $server_service_name   = 'graylog2-server'
      $server_config_file    = '/etc/graylog2/server/graylog2.conf'
      $server_sysconfig_file = '/etc/sysconfig/graylog2-server'
      $server_plugin_dir     = '/opt/graylog2-server/plugin'
      $web_package_name      = 'graylog2-web-interface'
      $web_service_name      = 'graylog2-web-interface'
      $web_config_file       = '/etc/graylog2/web-interface/graylog2-web-interface.conf'
      $web_sysconfig_file    = '/etc/sysconfig/graylog2-web-interface'
    }
    'Debian': {
      $es_repo_version       = '0.90'
      $server_package_name   = 'graylog2-server'
      $server_service_name   = 'graylog2-server'
      $server_config_file    = '/etc/graylog2/server/server.conf'
      $server_sysconfig_file = '/etc/defaults/graylog2-server'
      $server_plugin_dir     = '/opt/graylog2-server/plugin'
      $web_package_name      = 'graylog2-web'
      $web_service_name      = 'graylog2-web'
      $web_config_file       = '/etc/graylog2/web/graylog2-web-interface.conf'
      $web_sysconfig_file    = '/etc/defaults/graylog2-web'
    }
    default: {
      fail("${::operatingsystem} not supported")
      # But pull requests are gratefully accepted.. :)
    }
  }
}
