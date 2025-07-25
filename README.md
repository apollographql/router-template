[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/deploy/apollo-router)
[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=github.com/apollographql/router-template)

# Apollo Router Template

A starting point for deploying the Apollo Router using the new runtime container. This template provides easy deployment options for **Railway** and **Render**.

> 💡 **Quick Start**: This template uses the Apollo runtime container with sensible defaults. You can deploy immediately or customize the configuration for your specific needs.

## Prerequisites

- A [GraphOS account](https://www.apollographql.com/docs/graphos/) (free tier available)
- Your `APOLLO_KEY` and `APOLLO_GRAPH_REF` from GraphOS Studio

## Deploy Options

### Option 1: Use Railway Template (Recommended)
For the easiest deployment experience, use the official Railway template:
**[Deploy with Railway Template](https://railway.com/deploy/apollo-router)**

### Option 2: Clone and Deploy
For more control or to use other platforms:

1. **Fork or clone this repository to your own repo**
2. **Set up your environment variables** in your deployment platform:
   - `APOLLO_KEY` - Your GraphOS API key
   - `APOLLO_GRAPH_REF` - Your graph reference (e.g., `my-graph@production`)
3. **Deploy using one of the options below**:

**Railway**: Use the deploy button above or connect your repo in Railway

**Render**: Use the deploy button above or connect your repo in Render

## What's included

- `Dockerfile`—configured to use the Apollo Router runtime container
- `render.yaml`—Render deployment configuration
- `router.yaml`—sample router configuration (commented out by default)
- `.apollo/`—JSON schemas for better IDE experience
- `.github/workflows/`—automated dependency updates
- `.vscode/` and `.idea`—recommended editor settings
- `renovate.json`—keeps Router version up to date

## Apollo MCP Server

The Apollo Router includes an optional MCP (Model Context Protocol) server that is disabled by default. This server provides AI assistants with structured access to your GraphQL schema and operations.

### Enabling MCP Server

To enable the MCP server, set the `MCP_ENABLE` environment variable to `1`:

**Local development:**
```bash
docker run -it --env APOLLO_KEY=your-key --env APOLLO_GRAPH_REF=your-graph-ref --env MCP_ENABLE=1 -p4000:4000 apollo-runtime
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
docker run -it --env APOLLO_KEY=your-key --env APOLLO_GRAPH_REF=your-graph-ref -p4000:4000 apollo-runtime
```

**Using environment file:**
```bash
# Create .env file (don't commit this!)
echo "APOLLO_KEY=your-key-here" > .env
echo "APOLLO_GRAPH_REF=your-graph-ref-here" >> .env

# Run with env file
docker run -it --env-file .env -p4000:4000 apollo-runtime
```

Visit `http://localhost:4000` to access your router.

## Customization

The runtime container comes with sensible defaults, but you can customize the router configuration:

1. **Uncomment the lines in `Dockerfile`** to use a custom configuration:
   ```dockerfile
   COPY router.yaml /config.yaml
   CMD ["--config", "/config.yaml"]
   ```

2. **Edit `router.yaml`** to customize your router behavior

3. **Rebuild and redeploy** your container

## Recommended Next Steps

Once you have your router deployed, consider these production-ready improvements:

- [ ] **Set up CI/CD** to automatically deploy newer versions
- [ ] **Enable Renovate** on your repo to keep Router up to date
- [ ] **Set up deployment previews** for PRs to test changes
- [ ] **Configure subgraph secrets** so only your routers can access them
- [ ] **Review security settings** in your router configuration:
  - Configure appropriate CORS settings
  - Set up proper authentication/authorization
- [ ] **Monitor your router** with GraphOS observability features
- [ ] **Set up alerts** for important metrics and errors
- [ ] **Configure caching** for better performance
- [ ] **Clean up unused deployment files** (e.g., delete `render.yaml` if using Railway)

## Support

For issues with:
- **Apollo Router**: Check the [Apollo Router documentation](https://www.apollographql.com/docs/router/)
- **GraphOS**: Visit [GraphOS documentation](https://www.apollographql.com/docs/graphos/)
- **This template**: Open an issue in this repository

## License

This template is available under the MIT License. See [LICENSE](LICENSE) for details.
