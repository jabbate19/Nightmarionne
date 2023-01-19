class puppet {
    include vars
    $host = $vars::host
    $puppetexec = $::osfamily ? {
      'Debian' => '/opt/puppetlabs/bin/puppet',
      'Ubuntu' => '/opt/puppetlabs/bin/puppet',
      'RedHat' => '/opt/puppetlabs/bin/puppet',
      'FreeBSD' => '/usr/local/bin/puppet',
      'windows' => 'C:/Program Files/Puppet Labs/Puppet/bin/puppet.bat',
      default => ''
    }
    exec { 'Server':
      command => [$puppetexec, "config", "set", "server", $host, "--section", "main"]
    }
    exec { 'Serverport':
      command => [$puppetexec, "config", "set", "serverport", "443", "--section", "main"]
    }
    exec { 'Cache':
      command => [$puppetexec, "config", "set", "usecacheonfailure", "true", "--section", "agent"]
    }
    exec { 'runinterval':
      command => [$puppetexec, "config", "set", "runinterval", "5m", "--section", "agent"]
    }
    exec { 'Service':
      command => [$puppetexec, "resource", "service", "puppet", "ensure=running", "enable=true"]
    }
}
