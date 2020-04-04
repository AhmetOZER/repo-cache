FROM alpine
#ENV ENV="/root/.profile"
RUN apk update && apk add nginx && mkdir -p /run/nginx/

COPY nginx.conf /etc/nginx/
COPY distro.conf /etc/nginx/
COPY distro /etc/nginx/distro
COPY nginx-index.html /var/lib/nginx/html/index.html


CMD nginx
