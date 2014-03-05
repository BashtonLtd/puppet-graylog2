# Install mongodb if we're supposed to be managing it
class graylog2::server::mongodb {

  if ($graylog2::server::manage_mongodb) {
    include '::mongodb::server'
  }
}
