FROM ghcr.io/apollographql/router:v1.51.0

COPY router.yaml /config.yaml

 CMD ["--config", "/config.yaml"]
