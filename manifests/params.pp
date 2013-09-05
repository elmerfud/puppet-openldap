class openldap::params {

  $conf_file = '/etc/openldap/slapd.conf'

  $conf_temp_dir = '/tmp/openldap'

  $server_type = 'slave'

  $schema = ['core.schema',
             'core.ldif', 
             'cosine.schema',
             'cosine.ldif', 
             'nis.schema', 
             'nis.ldif', 
             'inetorgperson.schema',
             'inetorgperson.ldif', 
             'samba3.schema', 
             'lockfile.schema', 
             'yast.schema', 
             'ldap2dns.schema', 
             'radius.schema', 
             'mail.schema' ]

  $loglevel = '256'
  $pidfile = '/var/run/openldap/slapd.pid'
  $argsfile = '/var/run/openldap/slapd.args'
  $allow = 'bind_v2'

  $ldap_user = 'ldap'
  $ldap_group = 'ldap'

  $service_name = 'slapd'

}
