class openldap::package {

  case $::operatingsystem {
    centos,rhel: {
      class { 'openldap::package::redhat': }
    }
  }
}
