class openldap::service inherits openldap::params {

  exec { 'rebuild-slapd-conf':
    command     => "/bin/cat ${openldap::params::conf_temp_dir}/* > ${openldap::params::conf_file}",
    refreshonly => true,
    subscribe   => File["${openldap::params::conf_temp_dir}"],
  }

  service { 
    "${openldap::params::service_name}":
      ensure => stopped,
      enable => false,
      hasstatus => true,
      hasrestart => true,
      subscribe => Exec['rebuild-slapd-conf'];
  }

}
