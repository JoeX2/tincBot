FROM ubuntu

COPY tinc /etc/tinc

RUN apt update
RUN apt install -y net-tools tinc socat

CMD tincd --net=daler ; socat tcp-l:80,fork,reuseaddr tcp:192.168.6.1:80
