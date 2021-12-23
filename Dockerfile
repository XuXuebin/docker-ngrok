FROM golang:1.11.4-alpine
MAINTAINER XuXuebin <ddsbn@126.com>

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --no-cache git make openssl tzdata
env GIT_SSL_NO_VERIFY=true
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN git clone https://ghproxy.com/https://github.com/XuXuebin/ngrok.git /ngrok
RUN git clone https://ghproxy.com/https://github.com/jteeuwen/go-bindata /ngrok/src/github.com/jteeuwen/go-bindata
RUN git clone https://ghproxy.com/https://github.com/gorilla/websocket /ngrok/src/github.com/gorilla/websocket
RUN git clone https://ghproxy.com/https://github.com/inconshreveable/go-vhost /ngrok/src/github.com/inconshreveable/go-vhost
RUN git clone https://ghproxy.com/https://github.com/alecthomas/log4go /ngrok/src/github.com/alecthomas/log4go
RUN git clone https://ghproxy.com/https://github.com/nsf/termbox-go /ngrok/src/github.com/nsf/termbox-go
RUN git clone https://ghproxy.com/https://github.com/inconshreveable/mousetrap /ngrok/src/github.com/inconshreveable/mousetrap
RUN git clone https://ghproxy.com/https://github.com/rivo/uniseg /ngrok/src/github.com/rivo/uniseg
RUN git clone https://ghproxy.com/https://github.com/rcrowley/go-metrics /ngrok/src/github.com/rcrowley/go-metrics
RUN git clone https://ghproxy.com/https://github.com/mattn/go-runewidth /ngrok/src/github.com/mattn/go-runewidth
RUN git clone https://ghproxy.com/https://github.com/kardianos/osext /ngrok/src/github.com/kardianos/osext
RUN git clone https://ghproxy.com/https://github.com/kr/binarydist /ngrok/src/github.com/kr/binarydist

ADD *.sh /

ENV DOMAIN **None**
ENV MY_FILES /myfiles
ENV TUNNEL_ADDR :4443
ENV HTTP_ADDR :80
ENV HTTPS_ADDR :443

EXPOSE 4443
EXPOSE 80
EXPOSE 443

CMD /bin/sh
