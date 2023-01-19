class user {
  include stdlib
  include vars
  $users = $vars::users
  $sudoname = $::osfamily ? {
    'RedHat' => 'wheel',
    'FreeBSD' => 'wheel',
    default => 'sudo'
  }
  $users.each |$user| {
    if $::osfamily != 'windows' {
      user { $user:
        ensure => present,
        home => "/home/${user}",
        managehome => true,
        password => pw_hash($user, 'SHA-512', 'xyz'),
        groups => $sudoname,
        shell => '/bin/bash'
      }
    } elsif $::osfamily == 'windows' {
      user { $user:
        ensure => present,
        groups => ['Administrators'],
        membership => minimum,
        password => $user
      }
      exec { "${user}-active":
        path => 'C:/Windows/System32',
        command => ['net', 'user', $user, '/active:yes']
      }
    }
  }
}
