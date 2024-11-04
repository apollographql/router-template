FROM ghcr.io/apollographql/router:v1.57.1

COPY router.yaml /config.yaml

 CMD ["--config", "/config.yaml"]
