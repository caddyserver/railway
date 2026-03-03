#!/usr/bin/env bash
set -euo pipefail

which xcaddy || go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest

# Build --with flags from space- or newline-separated CADDY_PLUGINS env var
# e.g. "github.com/caddy-dns/cloudflare github.com/mholt/caddy-l4"
WITH_FLAGS=""
for plugin in ${CADDY_PLUGINS:-}; do
	WITH_FLAGS="$WITH_FLAGS --with $plugin"
done

xcaddy build ${CADDY_VERSION:+v$CADDY_VERSION} $WITH_FLAGS --output ./caddy