class puppet {
    include vars
    $host = $vars::host
    $path = $::osfamily ? {
      /(Debian|RedHat)/ => '/opt/puppetlabs/puppet/bin/',
      'FreeBSD' => '/usr/local/bin/',
      'windows' => 'C:/Program Files/Puppet Labs/Puppet/bin/',
      default => '/'
    }
    exec { 'Server':
      path => $path,
      command => ["puppet", "config", "set", "server", $host, "--section", "main"]
    }
    exec { 'Serverport':
      path => $path,
      command => ["puppet", "config", "set", "serverport", "443", "--section", "main"]
    }
    exec { 'Cache':
      path => $path,
      command => ["puppet", "config", "set", "usecacheonfailure", "true", "--section", "agent"]
    }
    exec { 'runinterval':
      path => $path,
      command => ["puppet", "config", "set", "runinterval", "5m", "--section", "agent"]
    }
    exec { 'Service':
      path => $path,
      command => ["puppet", "resource", "service", "puppet", "ensure=running", "enable=true"]
    }
}
