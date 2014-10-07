# == Class: graylog2
#
# Full description of class graylog2 here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class graylog2::server (
  $is_master = true,
  $password_secret = undef,
  $root_password_sha2 = undef,
  $rest_listen_api = 'http://127.0.0.1:12900/',
  $elasticsearch_max_docs_per_index = '20000000',
  $elasticsearch_max_number_of_indices = '20',
  $retention_strategy = 'delete',
  $elasticsearch_shards = '4',
  $elasticsearch_replicas = '0',
  $elasticsearch_index_prefix = 'graylog2',
  $elasticsearch_zen_ping_multicast_enabled = false,
  $allow_leading_wildcard_searches = false,
  $manage_elasticsearch = true,
  $manage_mongodb = true,
  $mongodb_host = '127.0.0.1'
) inherits graylog2::params {

  validate_string($password_secret)
  validate_string($root_password_sha2)

  if $elasticsearch_zen_ping_multicast_enabled == true {
    $disco_zen_ping_hosts = hiera('graylog2::server::elasticsearch_zen_ping_unicast_hosts')
  }

  class { 'graylog2::server::mongodb': } ->
  class { 'graylog2::server::elasticsearch': } ->
  class { 'graylog2::server::install': } ->
  class { 'graylog2::server::config': } ~>
  class { 'graylog2::server::service': } ->
  Class['graylog2::server']
}
