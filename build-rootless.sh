#!/usr/bin/env bash

set -e

GH_USER=${1:-puppetlabs}
BRANCH=${2:-test}

docker build \
  --target rootless \
  -t 'puppet-dev-tools:'${BRANCH} \
  --build-arg VCS_REF=$(git rev-parse --short HEAD) \
  --build-arg GH_USER=${GH_USER} \
  -f Dockerfile .
