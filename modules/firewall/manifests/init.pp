class firewall {
    if $::osfamily == 'debian' || $::osfamily == 'redhat' {
      exec { 'Flush':
        command => '/usr/sbin/iptables -F'
      }
      exec { 'Default INPUT':
        command => '/usr/sbin/iptables -P INPUT ACCEPT'
      }
      exec { 'Default OUTPUT':
	command => '/usr/sbin/iptables -P OUTPUT ACCEPT'
      }
    }
    if $::osfamily == 'freebsd' {
      exec { 'pfctl':
        command => '/sbin/pfctl -d'
      }
    }
    if $::osfamily == 'windows' {
      exec { 'Default':
        path => 'C:/Windows/System32',
        command => 'netsh advfirewall set currentprofile firewallpolicy allowinbound,allowoutbound'
      }
    }
}
