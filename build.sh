#!/bin/sh
set -ex

artifact=/usr/local/bin/caddy-custom

# split plugin list by space, comma, or newline; collapse extra space; join into flags
xcaddy build \
    $(echo "$CADDY_PLUGINS" | tr ' ,\n' '\n' | tr -s '\n' | sed '/^$/d' | sed 's/^/--with /') \
    --output "$artifact"

# print info for debugging/diagnostic purposes
"$artifact" build-info
"$artifact" list-modules