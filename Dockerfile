FROM ghcr.io/apollographql/router:v1.19.1

COPY router.yaml /config.yaml

 CMD ["--config", "/config.yaml"]
