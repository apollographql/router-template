# renovate: datasource=docker depName=ghcr.io/apollographql/apollo-runtime extractVersion=^[^_]+
FROM ghcr.io/apollographql/apollo-runtime:0.0.28_router2.7.0_mcp-server1.1.0

# The runtime container comes with a set of default values that work well for most use cases.
# Uncomment the line below if you'd like to modify the router configuration.
COPY router.yaml /config/router_config.yaml

# For local development without GraphOS:
# Uncomment the line below to use a locally composed supergraph schema
# COPY data/schema.graphql /config/schema.graphql

ENTRYPOINT ["/init"]
