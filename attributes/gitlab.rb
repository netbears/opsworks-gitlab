# frozen_string_literal: true

default['gitlab']['version']                    = '12.1.6'
default['gitlab']['install_path']               = '/etc/gitlab'

default['gitlab']['external_url']               = 'http://gitlab.netbears.com'
default['gitlab']['domain']                     = 'gitlab.netbears.com'

default['gitlab']['smtp_enable']                = 'false'
default['gitlab']['smtp_address']               = ''
default['gitlab']['smtp_port']                  = 587
default['gitlab']['smtp_user_name']             = ''
default['gitlab']['smtp_password']              = DecryptSecrets::Helper.decrypt(node['gitlab']['smtp_password_encrypted'])
default['gitlab']['smtp_domain']                = ''
default['gitlab']['smtp_authentication']        = 'login'
default['gitlab']['smtp_enable_starttls_auto']  = 'true'
default['gitlab']['smtp_tls']                   = 'false'

default['gitlab']['gitlab_signup_enabled']      = 'false'
default['gitlab']['gitlab_email_from']          = ''

default['gitlab']['git_timeout']                = 600
default['gitlab']['keepalive_timeout']          = 300
default['gitlab']['redirect_http_to_https']     = 'true'
default['gitlab']['worker_timeout']             = 300

default['gitlab']['manage_backup_path']                             = true
default['gitlab']['backup_path']                                    = '/mnt/backup'
default['gitlab']['backup_archive_permissions']                     = 0o644
default['gitlab']['backup_pg_schema']                               = 'public'
default['gitlab']['backup_keep_time']                               = 31_104_000
default['gitlab']['backup_upload_connection']['provider']           = 'AWS'
default['gitlab']['backup_upload_connection']['region']             = ''
default['gitlab']['backup_upload_remote_directory']                 = ''
default['gitlab']['backup_multipart_chunk_size']                    = 104_857_600
default['gitlab']['backup_encryption']                              = 'AES256'

default['gitlab']['ldap_enabled']                                   = 'true'
default['gitlab']['ldap_servers']['label']                          = 'LDAP'
default['gitlab']['ldap_servers']['host']                           = ''
default['gitlab']['ldap_servers']['port']                           = '389'
default['gitlab']['ldap_servers']['uid']                            = 'sAMAccountName'
default['gitlab']['ldap_servers']['method']                         = 'plain'
default['gitlab']['ldap_servers']['bind_dn']                        = ''
default['gitlab']['ldap_servers']['password']                       = DecryptSecrets::Helper.decrypt(node['gitlab']['ldap_servers']['password_encrypted'])
default['gitlab']['ldap_servers']['active_directory']               = 'false'
default['gitlab']['ldap_servers']['allow_username_or_email_login']  = 'false'
default['gitlab']['ldap_servers']['block_auto_created_users']       = 'false'
default['gitlab']['ldap_servers']['base']                           = ''
default['gitlab']['ldap_servers']['user_filter']                    = ''
default['gitlab']['ldap_servers']['attributes']['username']         = 'sAMAccountName'
default['gitlab']['ldap_servers']['attributes']['email']            = 'mail'
default['gitlab']['ldap_servers']['attributes']['name']             = 'displayName'
default['gitlab']['ldap_servers']['attributes']['first_name']       = 'givenName'
default['gitlab']['ldap_servers']['attributes']['last_name']        = 'sn'
default['gitlab']['ldap_servers']['lowercase_usernames']            = 'true'
default['gitlab']['ldap_servers']['group_base']                     = ''
default['gitlab']['ldap_servers']['admin_group']                    = ''
