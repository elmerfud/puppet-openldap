define openldap::database::ldap (
  $suffix = undef,
  $uri = [],
  $acl_bind = [],
  $idassert_bind = [],
  $idassert_autzFrom = undef,
  $overlay = undef,
  $overlay_maps = [],
  $database_number = undef ) {

  if ($database_number == undef) {
    $db_name = "eeee99_${name}"
  } else {
    $db_name = "eeee${database_number}_${name}"
  }

  file {
    "${openldap::params::conf_temp_dir}/${db_name}":
      ensure => file,
      content => template('openldap/ldap.erb'),
      notify => Class['openldap::service'];
  }

}
