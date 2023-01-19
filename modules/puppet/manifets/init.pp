class puppet {
    if $::osfamily in ['Debian', 'RedHat'] { 
      exec { 'Server':
        path => "/opt/puppetlabs/bin",
        command => ["puppet", "config", "set", "server", "nightmarionne.csh.rit.edu", "--section", "main"]
      }
      exec { 'Serverport':
        path => "/opt/puppetlabs/bin",
        command => ["puppet", "config", "set", "serverport", "443", "--section", "main"]
      }
      exec { 'Cache':
        path => "/opt/puppetlabs/bin",
        command => ["puppet", "config", "set", "usecacheonfailure", "true", "--section", "agent"]
      }
      exec { 'runinterval':
        path => "/opt/puppetlabs/bin",
        command => ["/puppet", "config", "set", "usecacheonfailure", "true", "--section", "agent"]
      }
    } elsif $::osfamily == 'FreeBSD' {
      exec { 'Server':
        path => "/usr/local/bin",
        command => ["puppet", "config", "set", "server", "nightmarionne.csh.rit.edu", "--section", "main"]
      }
      exec { 'Serverport':
        path => "/usr/local/bin",
        command => ["puppet", "config", "set", "serverport", "443", "--section", "main"]
      }
      exec { 'Cache':
        path => "/usr/local/bin",
        command => ["puppet", "config", "set", "usecacheonfailure", "true", "--section", "agent"]
      }
      exec { 'runinterval':
        path => "/usr/local/bin",
        command => ["/puppet", "config", "set", "usecacheonfailure", "true", "--section", "agent"]
      }
    } elsif $::osfamily == 'windows' {
      exec { 'Server':
        path => "C:/Program Files/Puppet Labs/Puppet/bin",
        command => ["puppet", "config", "set", "server", "nightmarionne.csh.rit.edu", "--section", "main"]
      }
      exec { 'Serverport':
        path => "C:/Program Files/Puppet Labs/Puppet/bin",
        command => ["puppet", "config", "set", "serverport", "443", "--section", "main"]
      }
      exec { 'Cache':
        path => "C:/Program Files/Puppet Labs/Puppet/bin",
        command => ["puppet", "config", "set", "usecacheonfailure", "true", "--section", "agent"]
      }
      exec { 'runinterval':
        path => "C:/Program Files/Puppet Labs/Puppet/bin",
        command => ["/puppet", "config", "set", "usecacheonfailure", "true", "--section", "agent"]
      }
    }
}
