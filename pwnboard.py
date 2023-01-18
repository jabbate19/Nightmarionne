from datetime import datetime
import requests

last_sent = {}
latest_time = {}

while True:
    with open("/var/log/puppetlabs/puppetserver/puppetserver.log") as f:
        for line in file:
            find_loc = line.find("Puppet Compiled catalog for")
            if find_loc > -1:
                host = line[find_loc+28:].split()[0]
                timestamp = datetime.strptime(line.split()[0], "%Y-%m-%dT%H:%M:%S.%f%z")
                if host in latest_time:
                    if timestamp > latest_time[host]:
                        latest_time[host] = timestamp
                else:
                    latest_time[host] = timestamp
    for host in latest_time:
        if host in last_sent:
            if latest_time[host] > last_sent[host]:
                requests.post("http://pwnboard.win/pwn/boxaccess", json={'ip':host, 'application':'NIGHTMARIONNE - Update'})
        else:
            requests.post("http://pwnboard.win/pwn/boxaccess", json={'ip':host, 'application':'NIGHTMARIONNE - Update'})
    last_sent = latest_time