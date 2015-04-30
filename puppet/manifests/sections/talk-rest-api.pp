mysql::grant { 'rest-api':
  mysql_db         => 'rest_api',
  mysql_user       => 'username',
  mysql_password   => 'password',
  mysql_privileges => 'ALL',
  mysql_host       => 'localhost',
} ->

mysql::queryfile { 'mma.sql':
  mysql_file       => '/srv/www/rest-api/.db/rest-api.sql',
  mysql_db         => 'rest_api',
  mysql_user       => 'username',
  mysql_password   => 'password',
  mysql_host       => 'localhost',
} 

exec { 'npm install':
  require => Class['nodejs'],
  cwd     => '/srv/www/rest-api/twizzle',
} ->
exec { 'node index.js &':
  cwd => '/srv/www/rest-api/twizzle',
}
