ARG VERSION

# https://caddyserver.com/docs/build#docker
FROM caddy:$VERSION-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:$VERSION

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
