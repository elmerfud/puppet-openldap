class openldap::config (
  $schema = $openldap::params::schema,
  $server_type = $openldap::params::server_type,
  $sasl_realm = undef,
  $sasl_host = undef
) inherits openldap::params {

  file {
    "${schema}":
      ensure => present,
      mode => 0644,
      path => "/etc/openldap/schema/${name}",
      source => "puppet://modules/openldap/schema/${name}",
      require => Class['openldap::package']; 
  }

  file {
    "${openldap::params::conf_temp_dir}":
      ensure => directory,
      purge => true,
      recurse => true
      mode => 700,
      owner => 'root',
      group => 'root';
  }

  file {
    "${openldap::params::conf_temp_dir}/slapd_header.conf":
      ensure => file,
      mode => 700,
      owner => 'root',
      group => 'root',
      content => template('openldap/slapd_header.erb'),
      require => File[${openldap::params::conf_temp_dir}];
  }

}
