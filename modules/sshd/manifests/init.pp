class sshd {
    if $::osfamily == 'debian' || $::osfamily == 'redhat' {
        package { 'openssh-server':
          ensure => present
        }
        service { 'sshd':
          ensure => running
        }
    }
    if $::osfamily == 'freebsd' {
        service { 'sshd':
          ensure => running
        }
    }
}
