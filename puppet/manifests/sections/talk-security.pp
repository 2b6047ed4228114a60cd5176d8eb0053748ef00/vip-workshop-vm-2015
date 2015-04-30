# Use the nodejs npm puppet-package provider so we get nicer error messages if something goes wrong
exec { 'npm install -g phantomjs':
  user    => 'root',
  unless  => 'which phantomjs',
  require => Class['nodejs'],
}

mysql::grant { 'security':
  mysql_db         => 'security',
  mysql_user       => 'username_here',
  mysql_password   => 'password_here',
  mysql_privileges => 'ALL',
  mysql_host       => 'localhost',
} ->

mysql::queryfile { 'security.sql':
  mysql_file       => '/srv/www/security/.db/security.sql',
  mysql_db         => 'security',
  mysql_user       => 'username_here',
  mysql_password   => 'password_here',
  mysql_host       => 'localhost',
}

file { '/srv/www/security/attacks/7-clickjacking.png':
  ensure => file,
  mode   => 666,
}

file { '/srv/www/security/wp-content/debug.log':
  ensure => file,
  mode   => 666,
}
