# == Class graylog2::config
#
# This class is called from graylog2
#
class graylog2::web::config {

  file { $::graylog2::web::config_file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('graylog2/graylog2-web-interface.conf.erb')
  }

  if ($::osfamily == 'RedHat') {
    file { $graylog2::params::web_sysconfig_file:
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0600',
      content => template('graylog2/graylog2-web-interface.sysconfig.erb'),
    }
  } elsif ($::osfamily == 'Debian'){
    file {$graylog2::params::web_sysconfig_file:
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/graylog2/graylog2.defaults'
    }
  }
}
