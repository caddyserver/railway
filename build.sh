#!/bin/sh
set -e

if [ -z "$CADDY_PLUGINS" ]; then
	cp /usr/bin/caddy /usr/local/bin/caddy-custom
	exit 0
fi

xcaddy build \
	$(echo "$CADDY_PLUGINS" | tr ' \n' '\n' | sed '/^$/d' | sed 's/^/--with /') \
	--output /usr/local/bin/caddy-custom