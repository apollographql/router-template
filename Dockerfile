FROM ghcr.io/apollographql/router:v1.43.0

COPY router.yaml /config.yaml

 CMD ["--config", "/config.yaml"]
