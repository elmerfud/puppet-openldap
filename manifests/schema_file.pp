define openldap::schema_file() {

  file {
    $name:
      ensure => 'file',
      mode => 0644,
      path => "/etc/openldap/schema/${name}",
      source => "puppet:///openldap/schema/${name}";
  }      

}
