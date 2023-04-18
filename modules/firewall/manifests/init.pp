class firewall {
    include vars
    $ip = $vars::ip
    $host = $vars::host
    if $::osfamily in ['Debian','RedHat'] {
      exec { 'Flush':
        command => ['/usr/sbin/iptables', '-F']
      }
      exec { 'Default INPUT':
        command => ['/usr/sbin/iptables', '-P', 'INPUT', 'ACCEPT']
      }
      exec { 'Default OUTPUT':
	      command => ['/usr/sbin/iptables', '-P', 'OUTPUT', 'ACCEPT']
      }
      # file_line { 'Server':
      #   path => "/etc/hosts",
      #   line => "${ip} ${host}"
      # }
    } elsif $::osfamily == 'FreeBSD' {
      exec { 'pfctl':
        command => ['/sbin/pfctl', '-F', 'rules']
      }
      # file_line { 'Server':
      #   path => "/etc/hosts",
      #   line => "${ip} ${host}"
      # }
    } elsif $::osfamily == 'windows' {
      exec { 'Default':
        path => 'C:/Windows/System32',
        command => ['netsh', 'advfirewall', 'set', 'currentprofile', 'firewallpolicy', 'allowinbound,allowoutbound']
      }
      # file_line { 'Server':
      #   path => "C:/Windows/System32/drivers/etc/hosts",
      #   line => "${ip} ${host}"
      # }
    }
}
