define openldap::databse:hdb ( 
  $suffix = undef,
  $checkpoint = '20480 5',
  $cachesize = '100000',
  $directory = undef,
  $index = [],
  $rootdn = undef,
  $rootpw = undef,
  $syncrepl_id = undef,
  $syncrepl_options = [] ) {

  file {
    "${openldap::params::conf_temp_dir}/${name}":
      ensure => file,
      content => template('openldap/hdb.erb'),
      notify => Class['openldap::service'];
  } 

}
