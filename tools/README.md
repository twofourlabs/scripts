# Tools Directory

This directory contains various tools and utilities for development and deployment tasks.

## Available Tools

### Metabase
Business intelligence and analytics platform.

```bash
curl -fsSL https://raw.githubusercontent.com/twofourlabs/scripts/refs/heads/master/tools/metabase.yml | docker-compose -f - up -d
```

## Prerequisites

- Docker
- Docker Compose

**Install Docker:**
```bash
curl -fsSL https://raw.githubusercontent.com/twofourlabs/scripts/refs/heads/master/docker/install-basic-docker.sh | bash
```

## Tool Categories

### Development Tools
Tools designed for development workflows and local development environments.

### Analytics & BI Tools
Business intelligence and data analytics platforms.

### Infrastructure Tools
Deployment and infrastructure management utilities.

## Adding New Tools

When adding a new tool to this directory:

1. **Create the necessary files** (Docker Compose, scripts, etc.)
2. **Add a simple curl command** for easy installation
3. **Update this README** with the new tool's information
4. **Test thoroughly** before committing

## Common Operations

### Starting Tools
```bash
# For Docker Compose tools
docker-compose -f <tool>.yml up -d

# For script-based tools
./<tool-script>.sh
```

### Stopping Tools
```bash
# For Docker Compose tools
docker-compose -f <tool>.yml down

# For script-based tools
# Check individual tool documentation
```

### Viewing Logs
```bash
# For Docker Compose tools
docker-compose -f <tool>.yml logs

# For specific services
docker-compose -f <tool>.yml logs <service-name>
```

### Updating Tools
```bash
# Pull latest images
docker-compose -f <tool>.yml pull

# Restart with new images
docker-compose -f <tool>.yml up -d
```

## Troubleshooting

### Common Issues

**Port Conflicts**
- Check if ports are already in use: `lsof -i :<port>`
- Modify port mappings in the tool's configuration file

**Container Issues**
- Check container status: `docker ps -a`
- View logs: `docker-compose -f <tool>.yml logs`
- Restart containers: `docker-compose -f <tool>.yml restart`

**Database Issues**
- Ensure database containers are running
- Check database logs for connection issues
- Verify network connectivity between containers

### Getting Help

1. Check the individual tool documentation above
2. Review Docker Compose logs
3. Verify system requirements
4. Check for port conflicts
5. Ensure Docker and Docker Compose are properly installed

## Security Considerations

- Default credentials are used for development environments
- For production use, change all default passwords
- Consider using environment variables for sensitive data
- Use Docker secrets for production deployments
- Regularly update tool versions for security patches

## Contributing

To add a new tool:

1. Create the necessary files
2. Test the tool thoroughly
3. Update this README with a simple curl command
4. Ensure the tool is self-contained and well-documented

## Version Information

Tools are regularly updated. Check individual tool documentation for current versions. 