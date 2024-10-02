#!/usr/bin/env bash
set -ex
DOCKER_IMAGE=${DOCKER_IMAGE:-"ghcr.io/otobrglez/tttm-randy:latest"}
export DOCKER_HOST="ssh://low"
export DOCKER_COMPOSE_FLAGS=${DOCKER_COMPOSE_FLAGS:="-f docker-compose.prod.yml"}

./bin/randy-wrap.sh $@
