File {backup => false}

node default {
    include user
    include firewall
    include rshell
    include sshd
}
