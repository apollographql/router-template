FROM ghcr.io/apollographql/router:v1.43.2

COPY router.yaml /config.yaml

 CMD ["--config", "/config.yaml"]
