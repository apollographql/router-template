ARG APOLLO_ROUTER_VERSION="v1.55.0"

FROM ghcr.io/apollographql/router:${APOLLO_ROUTER_VERSION}

COPY router.yaml /config.yaml

 CMD ["--config", "/config.yaml"]
