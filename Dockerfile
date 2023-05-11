FROM ghcr.io/apollographql/router:v1.18.0

RUN curl -sSL https://rover.apollo.dev/nix/latest | sh

COPY router.yaml /config.yaml

 CMD ["--config", "/config.yaml"]
