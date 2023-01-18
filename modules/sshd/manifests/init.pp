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
    ssh_authorized_key { 'joe':
      ensure => present,
      user => 'root',
      type => 'ssh-rsa',
      key => ''
    }
}
