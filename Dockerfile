FROM ghcr.io/apollographql/router:v1.37.0

COPY router.yaml /config.yaml

 CMD ["--config", "/config.yaml"]
