FROM ubuntu

COPY tinc /etc/tinc

RUN apt update
RUN apt install -y net-tools tinc socat

CMD tincd --net=daler ; socat tcp-l:80,fork,reuseaddr tcp:192.168.6.22:80 & socat tcp-l:443,fork,reuseaddr tcp:192.168.6.22:443

#docker run --rm -ti --cap-add=NET_ADMIN --device /dev/net/tun:/dev/net/tun -p 8080:80 tincbot
