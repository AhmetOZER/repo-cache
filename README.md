# Repo-Cache
Repository Cache Container

This Container is designed for Cache the package installer contents to reduce network bandwidth and also increase docker build speed.


You can use with docker port share for the external accessibility.

```bash
docker run --restart always -it -p 80:80 ahmetozer/repo-cache
```

## Local or without docker port share
If you don't want to expose your Container to everyone you can create a new network and use with only local network.

```bash
docker network create mynewnet
```
### Check the static IP address for Container
Check your IP addresses which ever you want to use for repository cache.

```bash
server:~ docker inspect mynewnet | grep Subnet
"Subnet": "172.19.0.0/16",
"Subnet": "2001:4700:4700:1111:f6a0::/80",

server:~ docker inspect bridge | grep 172.19.0.30 && echo 'your IP is used, please select another one' || echo 'Your IP is not used'
Your IP is not used
```

### Start Container
Set static IP address with --ip argumant and also for the automatically start Container requires custom --restart policy.
```bash
docker run --ip 172.19.0.30 --restart always --network mynewnet ahmetozer/repo-cache
```

### Forwarding hostnames to Container

```bash
IP=172.19.0.30
echo $IP dl-cdn.alpinelinux.org archive.ubuntu.com >> /etc/hostnames
```

Your Installation is completed and ready to use.
