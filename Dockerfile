FROM ghcr.io/apollographql/router:v1.57.0

COPY router.yaml /config.yaml

 CMD ["--config", "/config.yaml"]
