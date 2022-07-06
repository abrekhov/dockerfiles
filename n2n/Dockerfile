FROM alpine:latest as builder
RUN apk update && \
  apk add vim make gcc autoconf wget bash automake libc-dev linux-headers
RUN wget https://github.com/ntop/n2n/archive/refs/tags/3.1.1.tar.gz -O n2n.tgz
RUN tar xzvf n2n.tgz
RUN cd n2n-3.1.1 && ls && ./autogen.sh && ./configure && make && make install

FROM alpine
RUN apk update && apk add dumb-init
COPY --from=builder /usr/sbin/edge /usr/sbin/edge
COPY --from=builder /usr/sbin/supernode /usr/sbin/supernode
