mysql::grant { 'performance':
  mysql_db         => 'performance',
  mysql_user       => 'username',
  mysql_password   => 'password',
  mysql_privileges => 'ALL',
  mysql_host       => 'localhost',
} ->

# Install WordPress
exec { 'wp install /srv/www/performance':
  command => "/usr/bin/wp core install --url='${quickstart_domain}/performance' --title='${quickstart_domain} - Performance' --admin_email='wordpress+performance@${quickstart_domain}' --admin_name='wordpress' --admin_password='wordpress'",
  cwd     => '/srv/www/performance',
  unless  => "test -z ${quickstart_domain}",
  user    => 'vagrant',
  require => [
    Class['wp::cli'],
  ]
}

# Symlink db.php for Query Monitor
file { '/srv/www/performance/wp-content/db.php':
  ensure  => 'link',
  target  => 'plugins/query-monitor/wp-content/db.php',
  require => Exec['wp install /srv/www/performance'],
}

# Activate Theme
wp::command { 'theme activate performance':
  command  => 'theme activate performance',
  location => '/srv/www/performance',
  require  => Exec['wp install /srv/www/performance'],
}

# Activate Plugins
wp::command { 'plugin activate query-monitor':
  command  => 'plugin activate query-monitor',
  location => '/srv/www/performance',
  require  => Exec['wp install /srv/www/performance'],
}

# Update permalink structure
wp::command { "rewrite structure '/%year%/%monthnum%/%postname%'":
  command  => "rewrite structure '/%year%/%monthnum%/%postname%'",
  location => '/srv/www/performance',
  require  => Exec['wp install /srv/www/performance'],
}

# Create necessary content
wp::command { 'post create stampede':
  command  => 'post create --post_type=page --post_title="Dessert Showdown" --post_status=publish --post_name=stampede',
  location => '/srv/www/performance',
  require  => Wp::Command['theme activate performance'],
}

wp::command { 'post generate --count=5000':
  command  => 'post generate --count=5000',
  location => '/srv/www/performance',
  require  => Wp::Command['theme activate performance'],
}
