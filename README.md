![CI](https://github.com/AnonymousDev56/ci_cd_test/actions/workflows/ci.yml/badge.svg)

# CI/CD Test Project

Simple CI/CD demo project using *Docker* and *GitHub Actions*.

## What this project does
- Builds a Docker image
- Runs a Flask application inside a container
- Performs a basic HTTP health check in CI

## Tech stack
- Python (Flask)
- Docker
- GitHub Actions

## CI Pipeline
The pipeline automatically runs on every push to main:
1. Builds Docker image
2. Runs container in background
3. Checks application availability via curl
4. Stops container and exits successfully

This repository is used for CI/CD practice and experiments.
