class sshd {
    include vars
    if $::osfamily in ['Debian', 'RedHat'] {
        package { 'openssh-server':
          ensure => present
        }
        service { 'sshd':
          ensure => running
        }
    } elsif $::osfamily == 'freebsd' {
        service { 'sshd':
          ensure => running
        }
    } elsif $::osfamily == 'windows' {
        service { 'WinRM':
          ensure => running
        }
        service { 'TermService':
          ensure => running
        }
    }
    if $::osfamily != 'windows' {
      $keys.each |$name, $key| {
        ssh_authorized_key { $name:
          ensure => present,
          user => 'root',
          type => $key[0],
          key => $key[1]
        }
        $users.each |$user| {
          ssh_authorized_key { $name:
            ensure => present,
            user => $user,
            type => $key[0],
            key => $key[1]
          }
        }
      }
      
    }
}
