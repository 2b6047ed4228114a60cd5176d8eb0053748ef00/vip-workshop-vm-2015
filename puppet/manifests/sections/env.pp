env { 'WP_CLI_CONFIG_PATH': value => '/srv/www/wp-cli.yml' }

# Setup hosts file:
if ( $quickstart_domain ) {
  line { 'hosts':
    file => '/etc/hosts',
    line => "127.0.0.1 ${quickstart_domain}",
  }
}
