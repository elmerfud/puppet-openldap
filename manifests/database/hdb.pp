define openldap::database::hdb ( 
  $suffix = undef,
  $checkpoint = '20480 5',
  $cachesize = '100000',
  $directory = undef,
  $index = [],
  $rootdn = undef,
  $rootpw = undef,
  $syncrepl_id = undef,
  $syncrepl_options = [],
  $database_number = undef ) {

  if ($database_number == undef) {
    $db_name = "dddd99_${name}"
  } else {
    $db_name = "dddd${database_number}_${name}"
  }

  file {
    "${openldap::params::conf_temp_dir}/${db_name}":
      ensure => file,
      content => template('openldap/hdb.erb'),
      notify => Class['openldap::service'];
  } 

  file {
    $directory:
      ensure => directory,
      owner => 'ldap',
      group => 'ldap',
      mode => 0700;
  }

}
