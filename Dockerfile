FROM ghcr.io/apollographql/router:v1.49.1

COPY router.yaml /config.yaml

 CMD ["--config", "/config.yaml"]
