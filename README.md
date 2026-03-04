Caddy template for Railway
==========================

The official template used to deploy Caddy on [Railway](https://railway.com) with one click.


## Features

- **Plugin support.** Deploy a custom build of Caddy with any plugins that you specify.
- **Custom config.** Supports all configuration modes, but comes with a Caddyfile for starters.
- **Dependency-free.** No runtime dependencies makes for a very simple deployment!

## How to use

Click this button:

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/caddy?referralCode=YOPtw9&utm_medium=integration&utm_source=template&utm_campaign=generic)

Then on the page that opens, click "Deploy Now":

(TODO: Screenshot)

Before deploying, you can change "pre-configured environment variables" to customize your deployment:

<img width="1209" height="503" alt="Screenshot_20260304_120854" src="https://github.com/user-attachments/assets/f2fb9618-f33d-4cbc-aa62-a051df02c5f5" />

Click to expand, and fill in your customizations, for example:

<img width="1203" height="752" alt="Screenshot_20260304_121421" src="https://github.com/user-attachments/assets/17fab4a9-7aa0-4807-b5fb-738de6df4d9c" />

(We recommend pasting values in, rather than typing them. You can also change these later and redeploy.)

### Variables

Name | Explanation | Examples
-----|-------------|----------
`CADDY_VERSION` | The version to build as a git ref (tag, branch, or commit SHA); default is latest tag | `v2.11.2`, `master`, `2dbcdefbbee68e7b4a31ac66361a0f4e3bcd2eea`
`CADDY_PLUGINS` | List of plugins to build, separated by spaces or newlines | `github.com/caddy-dns/cloudflare github.com/mholt/caddy-l4`
`CADDYFILE` | Caddy config to use (assuming default Caddyfile is unchanged, which uses this env var for the whole file) | `:8080 {...`

(WIP. More docs coming soon.)
