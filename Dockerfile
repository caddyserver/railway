FROM caddy:builder AS builder

ARG CADDY_VERSION=
ARG CADDY_PLUGINS=

RUN xcaddy build ${CADDY_VERSION:+${CADDY_VERSION}} \
	$(echo ${CADDY_PLUGINS} | tr ' \n' '\n' | sed '/^$/d' | sed 's/^/--with /' | tr '\n' ' ')

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile