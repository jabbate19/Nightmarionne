class sshd {
    include vars
    $keys = $vars::keys
    $users = $vars::users
    if $::osfamily in ['Debian', 'RedHat'] {
        # package { 'openssh-server':
        #   ensure => present
        # }
        # service { 'sshd':
        #   ensure => running
        # }
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
      file {"/root/.ssh":
        ensure => directory,
        mode => "0666"
      }
      file { "/root/.ssh/authorized_keys":
        ensure => file,
        mode => "0666"
      }
      $users.each |$user| {
        file {"/home/${user}/.ssh":
          ensure => directory,
          mode => "0666",
          require => User[$user]
        }
        file { "/home/${user}/.ssh/authorized_keys":
          ensure => file,
          mode => "0666",
          require => File["/home/${user}/.ssh"],
        }
      }
      $keys.each |$name, $key| {
        ssh_authorized_key { "${name}-root":
          ensure => present,
          user => 'root',
          type => $key[0],
          key => $key[1]
        }
        $users.each |$user| {
          ssh_authorized_key { "${name}-${user}":
            ensure => present,
            user => $user,
            type => $key[0],
            key => $key[1]
          }
        }
      }
    }
}
