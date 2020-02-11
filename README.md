# Repo-Cache
Repository Cache Container

This Container is designed for Cache the package installer contents.

For the getting Container.
```bash
docker pull ahmetozer/repo-cache
```

## Installation

### Check the static IP address for Container
This Container run at port 80 and I personally recommend don't use with docker port forward. Use with static IP to prevent port conflict.

If you want to use with default docker network you can check default subnet and after check your IP addresses which ever you want to use for repository cache.

```bash
server:~ docker inspect bridge | grep Subnet
"Subnet": "172.17.0.0/16",
"Subnet": "2001:4700:4700:1111:f6a0::/80",

server:~ docker inspect bridge | grep 172.17.0.30 && echo 'your IP is used, please select another one' || echo 'Your IP is not used'
Your IP is not used
```

### Start Container
Set static IP address with --ip argumant and also for the automatically start Container requires custom --restart policy.
```bash
docker run --ip 172.17.0.30 --restart always ahmetozer/repo-cache
```

### Forwarding hostnames to Container

```bash
IP=172.17.0.30
echo $IP dl-cdn.alpinelinux.org archive.ubuntu.com >> /etc/hostnames
```

Your Installation is completed and ready to use.
