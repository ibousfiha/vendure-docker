# Vendure Docker Project

A Dockerized Vendure project for seamless database schema synchronization and easy production deployments.

## Getting Started

Clone this repository and navigate to the project folder.

## Using Makefile Commands

The `Makefile` includes a set of commands designed to simplify the build and deployment process. Below are explanations for the key commands:

### Up

Starts up the necessary services for development, including the database and server. If the database is not already synchronized, it will be.

```bash
make up
```

### Down

Stops all running services and cleans up Docker assets.

```bash
make down
```

### Restart

Restarts all services. This is equivalent to running `make down` followed by `make up`.

```bash
make restart
```

### Deploy

Deploys the application in a production environment. This will use production settings and services as defined in your configuration.

```bash
make deploy
```

### Reset-DB

Resets the database by removing its Docker volume. Use this if you need to start with a fresh database.

```bash
make reset-db
```

## Vendure Development

For in-depth information and guidelines on developing with Vendure, please refer to the official [Vendure Documentation](https://beta-docs.vendure.io/).

This resource provides comprehensive tutorials, API references, and best practices to help you better understand and efficiently work with Vendure.
