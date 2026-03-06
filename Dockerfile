FROM caddy:alpine

COPY ./www /www
COPY ./Caddyfile /etc/caddy/Caddyfile