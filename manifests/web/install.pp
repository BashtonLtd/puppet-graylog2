# == Class graylog2::install
#
class graylog2::web::install {
  include graylog2::params

  package { $graylog2::params::web_package_name:
    ensure => present,
  }
}
