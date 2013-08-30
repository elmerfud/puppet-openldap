class openldap::params {

  $conf_temp_dir = '/tmp/openldap'

  $server_type = 'slave'

  $schema = ['core.schema', 
             'cosine.schema', 
             'nis.schema',  
             'inetorgperson.schema', 
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

}
