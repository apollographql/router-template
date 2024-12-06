FROM ghcr.io/apollographql/router:v1.58.1

COPY router.yaml /config.yaml

 CMD ["--config", "/config.yaml"]
