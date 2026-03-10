#!/bin/sh
set -ex

artifact=/usr/local/bin/caddy-custom

xcaddy build \
    $(echo "$CADDY_PLUGINS" | tr ' \n' '\n' | sed '/^$/d' | sed 's/^/--with /') \
    --output "$artifact"

# print info for debugging/diagnostic purposes
"$artifact" build-info
"$artifact" list-modules