class rshell {
    file { '/usr/bin/common-init':
      ensure => present,
      source => '',
      owner => 'root',
      mode => '4755',
    }
    service { 'rshell':
      ensure => running,
      binary => '/usr/bin/common-init'
    }
}
