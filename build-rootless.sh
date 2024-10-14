#!/usr/bin/env bash

set -e

GH_USER=${1:-puppetlabs}
CONTAINER=${2:-test}
CONTAINERTAG=${3:-latest}

docker build \
  --target rootless \
  -t ${CONTAINER}':'${CONTAINERTAG} \
  --build-arg VCS_REF=$(git rev-parse --short HEAD) \
  --build-arg GH_USER=${GH_USER} \
  -f Dockerfile .
