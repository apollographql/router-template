FROM ghcr.io/apollographql/router:v1.18.1

COPY router.yaml /config.yaml

 CMD ["--config", "/config.yaml"]
