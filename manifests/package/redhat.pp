class openldap::package::redhat {
  $packages = [ 'openldap-servers', 'cyrus-sasl-ldap' ]
  package {
    $packages:
      ensure => present;
  }
}
