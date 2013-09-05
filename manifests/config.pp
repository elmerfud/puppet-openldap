class openldap::config (
  $schema = $openldap::params::schema,
  $server_type = $openldap::params::server_type,
  $sasl_realm = undef,
  $sasl_host = undef
) inherits openldap::params {


  openldap::schema_file { 
    $schema: 
  }

  file {
    "${openldap::params::conf_temp_dir}":
      ensure => directory,
      purge => true,
      recurse => true,
      mode => 700,
      owner => 'root',
      group => 'root';
  }

  file {
    "${openldap::params::conf_temp_dir}/aaaa_slapd_header.conf":
      ensure => file,
      mode => 700,
      owner => 'root',
      group => 'root',
      content => template('openldap/slapd_header.erb'),
      require => File["${openldap::params::conf_temp_dir}"];
  }

  file {
    "${openldap::params::conf_temp_dir}/zzzz_slapd_footer.conf":
      ensure => file,
      mode => 700,
      owner => 'root',
      group => 'root',
      content => template('openldap/slapd_footer.erb'),
      require => File["${openldap::params::conf_temp_dir}"];
  }

}
