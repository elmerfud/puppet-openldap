define openldap::database::ldap (
  $suffix = undef,
  $uri = [],
  $acl_bind = [],
  $idassert_bind = [],
  $idassert_autzFrom = undef,
  $overlay = undef,
  $overlay_maps = [] ) {

  file {
    "${openldap::params::conf_temp_dir}/${name}":
      ensure => file,
      content => template('openldap/ldap.erb'),
      notify => Class['openldap::service'];
  }

}
