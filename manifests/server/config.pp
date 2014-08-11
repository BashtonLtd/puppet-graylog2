# == Class graylog2::config
#
# This class is called from graylog2
#
class graylog2::server::config {

  file { $graylog2::params::server_config_file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('graylog2/graylog2.server.conf.erb'),
  }

  if ($::osfamily == 'RedHat') {
    file { $graylog2::params::server_sysconfig_file:
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0600',
      content => template('graylog2/graylog2-server.sysconfig.erb'),
    }
  } elsif ($::osfamily == 'Debian'){
    file {$graylog2::params::server_sysconfig_file:
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/graylog2/graylog2.defaults'
    }
  }
}
