FROM docker.io/library/nginx:latest

RUN mkdir -p /etc/nginx/ssl

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html


EXPOSE 80 443
