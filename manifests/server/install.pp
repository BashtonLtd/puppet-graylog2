# == Class graylog2::install
#
class graylog2::server::install {
  include graylog2::params

  package { $graylog2::params::server_package_name:
    ensure => present,
  }
}
