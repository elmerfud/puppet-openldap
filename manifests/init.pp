class openldap (
  $server_type = undef
) inherits openldap::params {

  class { 'openldap::package': }

  case $server_type {
    'master': {

    }
    'slave': {
      class {
        'openldap::config':
          server_type => $server_type,
          require => Class['openldap::package'],
          notify => Class['openldap::service'];
      }
    }
    default: {
      fail("Unsupported server_type option ${server_type}")
    }
  } 

}
