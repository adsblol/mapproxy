# mapproxy

Inspired by https://github.com/PDOK/mapproxy-docker, a container that runs mapproxy with very little wrapping.

Builds for ARM64 and AMD64 are available at ghcr.io/adsblol/mapproxy

It exposes port 8000, you might want to mount /app/mapproxy.yaml to your configuration.

It is built on Python 3.11 and the [latest mapproxy version / dependencies](requirements.txt) using Gunicorn.

