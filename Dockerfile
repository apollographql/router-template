FROM ghcr.io/apollographql/apollo-runtime:latest

# The runtime container comes with a set of default values that work well for most use cases.
# Uncomment the line below if you'd like to modify the router configuration.
COPY router.yaml /config/router_config.yaml

ENTRYPOINT ["/init"]
