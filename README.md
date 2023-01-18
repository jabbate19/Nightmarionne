# Nightmarionne
![Nightmarionne](https://static.wikia.nocookie.net/triple-a-fazbear/images/4/4b/Nightmarionne-0.png/revision/latest?cb=20200603171537)
## A Puppet-Based Persistence Method
### Agent in installed on all clients, and then reach out to the master for commands
### Often includes: Users, SSH Keys, Services, and Firewall

## To Add your Tool to Nightmarionne:
- Create a module with your tool name (Follow rshell format)
- Add "include TOOL" to manifests/site.pp
- Profit