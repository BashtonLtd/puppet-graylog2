# Install elasticsearch if we're supposed to be managing it
class graylog2::server::elasticsearch (
  $repo_version = $::graylog2::params::es_repo_version
) {

  if ($graylog2::server::manage_elasticsearch) {
    class { '::elasticsearch':
      manage_repo  => true,
      repo_version => $repo_version,
      config    => {
        cluster => {
          name  => 'graylog2'
        }
      }
    }
  }
}
