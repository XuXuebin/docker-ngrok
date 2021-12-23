# DOCKER NGROK IMAGE

## BUILD IMAGE

```linux
git clone https://ghproxy.com/https://github.com/XuXuebin/docker-ngrok.git
cd docker-ngrok
docker build -t xuxuebin/ngrok .
```

## RUN

- you must mount your folder (E.g `/data/ngrok`) to container `/myfiles`
- if it is the first run, it will generate the binaries file and CA in your floder `/data/ngrok`

```linux
docker run -idt --name ngrok-server \
-v /data/ngrok:/myfiles \
-e DOMAIN='tunnel.smartcellphone.cn' xuxuebin/ngrok /bin/sh /server.sh
```
