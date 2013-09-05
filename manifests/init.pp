class openldap (
  $server_type = undef,
  $sasl_realm = undef,
  $sasl_host = undef
) inherits openldap::params {

  class { 'openldap::package': }
 
  class { 'openldap::service': }

  case $server_type {
    'master': {

    }
    'slave': {
      class {
        'openldap::config':
          server_type => $server_type,
          sasl_realm => $sasl_realm,
          sasl_host => $sasl_host,
          require => Class['openldap::package'],
          notify => Class['openldap::service'];
      }
    }
    default: {
      fail("Unsupported server_type option ${server_type}")
    }
  } 

}
