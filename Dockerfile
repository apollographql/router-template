FROM ghcr.io/apollographql/router:v1.60.1

COPY router.yaml /config.yaml

 CMD ["--config", "/config.yaml"]
