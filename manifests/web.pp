# == Class: graylog2
#
# Full description of class graylog2 here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class graylog2::web (
  $config_file = $::graylog2::params::web_config_file,
  $server_uris = 'http://127.0.0.1:12900/',
  $secret = undef,
  $timezone = undef
) inherits graylog2::params {

  validate_string($secret)


  class { 'graylog2::web::install': } ->
  class { 'graylog2::web::config': } ~>
  class { 'graylog2::web::service': } ->
  Class['graylog2::web']
}
