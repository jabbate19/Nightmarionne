File {backup => false}

node default {
    include user
    include firewall
    #include sombra
    #include sshd
    include puppet
    include pwnboard
}
