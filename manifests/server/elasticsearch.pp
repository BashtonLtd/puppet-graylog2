# Install elasticsearch if we're supposed to be managing it
class graylog2::server::elasticsearch {

  if ($graylog2::server::manage_elasticsearch) {
    class { '::elasticsearch':
      config    => {
        cluster => {
          name  => 'graylog2'
        }
      }
    }
  }
}
