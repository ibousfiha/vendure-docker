# Vendure Docker Project

A Dockerized Vendure project for seamless database schema synchronization and easy production deployments.

## Getting Started

Clone this repository and navigate to the project folder.

## Using Makefile Commands

The `Makefile` includes a set of commands designed to simplify the build and deployment process. Below are explanations for the key commands:

### `make up`

Starts the database and server containers. If `db_synced.flag` doesn't exist, it sets the `DB_SYNCHRONIZE` flag to `true`.

### `make down`

Stops all running containers and removes unused volumes.

### `make restart`

Restarts all containers by running `make down` followed by `make up`.

### `make deploy`

Sets the environment to production and builds the project, including the database and server containers.

### `make reset-db`

Removes the existing database volume, effectively resetting the database.

These commands help you manage your Docker containers effectively and deploy your Vendure project seamlessly.

Certainly, you can include a section in your README that directs users to the official Vendure documentation for further details.

## Vendure Development

For in-depth information and guidelines on developing with Vendure, please refer to the official [Vendure Documentation](https://beta-docs.vendure.io/).

This resource provides comprehensive tutorials, API references, and best practices to help you better understand and efficiently work with Vendure.
