# == Class graylog2::service
#
# This class is meant to be called from graylog2
# It ensure the service is running
#
class graylog2::web::service {
  include graylog2::params

  service { $graylog2::params::web_service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
