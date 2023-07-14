FROM ghcr.io/apollographql/router:v1.24.0

COPY router.yaml /config.yaml

 CMD ["--config", "/config.yaml"]
