[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/deploy/apollo-router)
[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=github.com/apollographql/router-template)

# Apollo Runtime Template

A starting point for deploying the Apollo Router using the new runtime container. This template provides easy deployment options for **Railway** and **Render**.

> 💡 **Quick Start**: This template uses the Apollo runtime container with sensible defaults. You can deploy immediately or customize the configuration for your specific needs.

## Prerequisites

- A [GraphOS account](https://www.apollographql.com/docs/graphos/) (Free and usage-based tiers available)
- Your `APOLLO_KEY` and `APOLLO_GRAPH_REF` from GraphOS Studio

## Deploy Options

### Option 1: Use Railway Template (Recommended)
For the easiest deployment experience, use the official Railway template:
**[Deploy with Railway Template](https://railway.com/deploy/apollo-router)**

### Option 2: Clone and Deploy
For more control or to use other platforms:

1. **Fork or clone this repository to your own repo**
2. **Set up your environment variables** in your deployment platform:
   - `APOLLO_KEY` - Your Graph API key
   - `APOLLO_GRAPH_REF` - Your graph reference (e.g., `my-graph@production`)
3. **Deploy using one of the options below**:

**Railway**: Use the deploy button above or connect your repo in Railway

**Render**: Use the deploy button above or connect your repo in Render

### Alternative Deployment Options
Looking to deploy to other platforms like AWS, GCP, or Azure? Check out our comprehensive deployment guides in the [Apollo Router documentation](https://www.apollographql.com/docs/graphos/routing#deployment-guides). These guides provide step-by-step instructions for various cloud providers and deployment scenarios.

## What's included

- `Dockerfile`—configured to use the Apollo Router runtime container
- `render.yaml`—Render deployment configuration
- `router.yaml`—sample router configuration
- `.apollo/`—JSON schemas for better IDE experience
- `.github/workflows/`—automated dependency updates
- `.vscode/` and `.idea/`—recommended editor settings (install recommended extensions when prompted)
- `renovate.json`—keeps Router version up to date

## Apollo MCP Server

The Apollo Runtime container includes an optional MCP (Model Context Protocol) server that is disabled by default. This server provides AI assistants with structured access to your GraphQL schema and operations.

### Enabling MCP Server

To enable the MCP server, set the `MCP_ENABLE` environment variable to `1`:

**Local development:**
```bash
docker run -it --env APOLLO_KEY=your-key --env APOLLO_GRAPH_REF=your-graph-ref --env MCP_ENABLE=1 -p 4000:4000 apollo-runtime
```

**Railway deployment:**
Add `MCP_ENABLE=1` to your environment variables in the Railway dashboard.

**Render deployment:**
Add `MCP_ENABLE=1` to your environment variables in the Render dashboard.

### MCP Server Features

When enabled, the MCP server provides:
- Schema introspection capabilities for AI assistants
- Structured access to GraphQL operations
- Enhanced development experience with AI tools

## Local Development

**Quick test with Docker:**
```bash
docker build -t apollo-runtime .
docker run -it --env APOLLO_KEY=your-key --env APOLLO_GRAPH_REF=your-graph-ref -p 4000:4000 apollo-runtime
```

**Using environment file:**
```bash
# Create .env file (don't commit this!)
echo "APOLLO_KEY=your-key-here" > .env
echo "APOLLO_GRAPH_REF=your-graph-ref-here" >> .env

# Run with env file
docker run -it --env-file .env -p 4000:4000 apollo-runtime
```

Visit `http://localhost:4000` to access your router.

## Running Locally Without GraphOS

You can run the Apollo Router locally using a supergraph schema file instead of connecting to GraphOS. This is useful for:
- Local development without internet connectivity
- Testing federation changes before publishing
- Running in air-gapped environments

### Steps to Run with Local Schema

1. **Install Rover CLI** (if not already installed):
   ```bash
   curl -sSL https://rover.apollo.dev/nix/latest | sh
   ```

2. **Start your subgraph services** locally (ensure they're running on the ports specified in `supergraph.yaml`)

3. **Compose your supergraph schema**:
   ```bash
   # Create the data directory if it doesn't exist
   mkdir -p data
   
   # Generate the supergraph schema from your subgraphs
   rover supergraph compose --config ./supergraph.yaml > data/schema.graphql
   ```

4. **Create a modified Dockerfile** for local development:
   ```dockerfile
   FROM ghcr.io/apollographql/apollo-runtime:0.0.14_router2.5.0_mcp-server0.7.0
   
   # Copy the router configuration
   COPY data/router.yaml /config/router_config.yaml
   
   # Copy the composed supergraph schema
   COPY data/schema.graphql /config/schema.graphql
   
   ENTRYPOINT ["/init"]
   ```

5. **Run the router without GraphOS credentials**:
   ```bash
   # Build the container
   docker build -t apollo-router-local .
   
   # Run without APOLLO_KEY and APOLLO_GRAPH_REF
   docker run -it -p 4000:4000 apollo-router-local
   ```

### Notes on Local Development

- The `supergraph.yaml` file defines your federated architecture
- Update the subgraph URLs in `supergraph.yaml` to match your local setup
- Re-run `rover supergraph compose` whenever you change your subgraph schemas
- The router expects the schema at `/config/schema.graphql` and config at `/config/router_config.yaml`

## Customization

The runtime container comes with sensible defaults, but you can customize the router configuration:

1. **Uncomment the lines in `Dockerfile`** to use a custom configuration:
   ```dockerfile
   COPY router.yaml /config.yaml
   CMD ["--config", "/config.yaml"]
   ```

2. **Edit `router.yaml`** to customize your router behavior

3. **Rebuild and redeploy** your container

## ⚠️ Security Configuration

This template includes development-friendly defaults that **are not production-ready**. Review these settings before deploying to production:

### CORS Configuration
- **Current setting**: `allow_any_origin: true` - allows requests from any domain
- **Security risk**: This can enable cross-site request forgery (CSRF) attacks
- **For production**: Replace with specific origins in `router.yaml`:
  ```yaml
  cors:
    origins:
      - "https://yourdomain.com"
      - "https://app.yourdomain.com"
  ```
- **Environment variables**: Use `${env.FRONTEND_URL}` for flexible deployments

### Other Security Considerations
- **Introspection**: Enabled by default (`introspection: true`) - disable in production
- **Sandbox**: disabled by default
- **Subgraph errors**: All errors exposed (`include_subgraph_errors.all: true`) - consider limiting in production

## Recommended Next Steps

Once you have your router deployed, consider these production-ready improvements:

- [ ] **Set up CI/CD** to automatically deploy newer versions
- [ ] **Enable Renovate** on your repo to keep Router up to date
- [ ] **Set up deployment previews** for PRs to test changes
- [ ] **Configure subgraph secrets** so only your routers can access them
- [ ] **Review security settings** in your router configuration:
  - [ ] Configure appropriate CORS settings
  - [ ] Set up proper authentication/authorization
- [ ] **Monitor your router** with GraphOS observability features
- [ ] **Set up alerts** for important metrics and errors
- [ ] **Configure caching** for better performance
- [ ] **Clean up unused deployment files** (e.g., delete `render.yaml` if using Railway)

## Support

For issues with:
- **Apollo Router**: Check the [Apollo Router documentation](https://www.apollographql.com/docs/router/)
- **GraphOS**: Visit [GraphOS documentation](https://www.apollographql.com/docs/graphos/)
- ** MCP Server**: Check the [MCP Server documentation](https://www.apollographql.com/docs/apollo-mcp-server)
- **IDE Support**: Check the [IDE Extensions documentation](https://www.apollographql.com/docs/apollo-server/ide-support/)
- **This template**: Open an issue in this repository

## License

This template is available under the MIT License. See [LICENSE](LICENSE) for details.
