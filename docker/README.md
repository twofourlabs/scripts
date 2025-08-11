# Docker Directory

This directory contains Docker Compose configuration files for various services used in this project.

## Services

### Redis
In-memory data structure store, used as a database, cache, and message broker.

**Quick start:**
```bash
curl -fsSL https://raw.githubusercontent.com/twofourlabs/scripts/refs/heads/master/docker/redis.yml | docker compose -f - up -d
```

### Metabase
Open source business intelligence tool for interactive dashboards and analytics.

**Quick start:**
```bash
curl -fsSL https://raw.githubusercontent.com/twofourlabs/scripts/refs/heads/master/docker/metabase.yml | docker compose -f - up -d
```

### n8n
Open source workflow automation tool that allows you to connect different services and automate workflows.

**Quick start:**
```bash
curl -fsSL https://raw.githubusercontent.com/twofourlabs/scripts/refs/heads/master/docker/n8n.yml | docker compose -f - up -d
```