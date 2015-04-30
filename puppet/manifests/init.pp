Exec { path => '/usr/local/node/node-default/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/vagrant_ruby/bin' }

import 'helpers/*'
import 'sections/*'

# Make sure apt-get is up-to-date before we do anything else
stage { 'updates': before => Stage['main'] }
class { 'updates': stage => updates }

# updates
class updates {
    exec { 'apt-get update':
        command => 'apt-get update --quiet --yes',
        timeout => 0
    }

    if 'virtualbox' != $virtual {
        exec { 'apt-get upgrade':
            command => 'apt-get upgrade --quiet --yes',
            timeout => 0
        }
    }
}

class { 'nodejs':
  version => 'stable',
  make_install => false,
}

user { 'vagrant':
    ensure => 'present',
    system => true,
    notify => Service['php5-fpm'],
}
