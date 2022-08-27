# n2n fast vpn tunnel

## Quickstart

### Host A

```bash
docker run -ti -e N2N_KEY=<secret_key> -e N2N_COMMUNITY=<mycommunity> --device /dev/net/tun --cap-add NET_ADMIN --network=host -d abrekhov/n2n:alpine edge -lsupernode.ntop.org:7777 -r -f -a192.168.100.<X>
```

### Host B

```bash
docker run -ti -e N2N_KEY=<secret_key> -e N2N_COMMUNITY=<mycommunity> --device /dev/net/tun --cap-add NET_ADMIN --network=host -d abrekhov/n2n:alpine edge -lsupernode.ntop.org:7777 -r -f -a192.168.100.<Y>
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

## Cross platform manifests

```bash
docker manifest create abrekhov/n2n:latest arekhov/n2n:alpine-amd64-linux abrekhov:n2n:alpine-arm64-linux
docker manifest annotate abrekhov/n2n:latest abrekhov/n2n:alpine-arm64-linux --arch arm
docker manifest annotate abrekhov/n2n:latest abrekhov/n2n:alpine-amd64-linux --arch amd64
docker manifest push
```
