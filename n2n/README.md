# n2n fast vpn tunnel

## Quickstart

### Host A

```bash
docker run -ti --device /dev/net/tun --cap-add NET_ADMIN --network=host abrekhov/n2n:alpine sh

# Inside container
edge -c <community> -k <secret_pwd> -a 192.168.100.<X>  -l supernode.ntop.org:7777 
# ^p^q - detach 
```

### Host B

```bash
docker run -ti --device /dev/net/tun --cap-add NET_ADMIN --network=host abrekhov/n2n:alpine sh

# Inside container
edge -c <community> -k <secret_pwd> -a 192.168.100.<Y>  -l supernode.ntop.org:7777 
# ^p^q - detach 
```

or

```bash
cp .env.example .env
vim .env
docker compose up -d 
```

### Test

```bash
# host A (192.168.100.<X>)

ping 192.168.100.<Y> # host B
PING 192.168.100.<Y> (192.168.100.<Y>) 56(84) bytes of data.
64 bytes from 192.168.100.<Y>: icmp_seq=1 ttl=64 time=0.376 ms
64 bytes from 192.168.100.<Y>: icmp_seq=2 ttl=64 time=0.243 ms
```

### If you need to route other subnets

```bash
# on host A
ip r add 10.40.2.0/24 via 192.168.100.<Y> # add route to remote subnets via remote peer
# on host B
ip r add 10.30.1.0/24 via 192.168.100.<X> # add route to remote subnets via remote peer
```
