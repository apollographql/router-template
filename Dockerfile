FROM ghcr.io/apollographql/router:v1.35.0

COPY router.yaml /config.yaml

 CMD ["--config", "/config.yaml"]
