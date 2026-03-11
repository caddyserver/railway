FROM caddy:builder AS builder

ARG CADDY_PLUGINS=

COPY --chmod=755 build.sh /build.sh
RUN sh /build.sh

FROM caddy:alpine

COPY --from=builder /usr/local/bin/caddy-custom /usr/bin/caddy
COPY ./www /www
COPY ./Caddyfile /etc/caddy/Caddyfile