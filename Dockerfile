FROM ghcr.io/apollographql/router:v1.44.0

COPY router.yaml /config.yaml

 CMD ["--config", "/config.yaml"]
