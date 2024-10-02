#!/usr/bin/env bash
set -ex

RANDY_HOME=${RANDY_HOME:=$(pwd)}
DOCKER_COMPOSE_FLAGS=${DOCKER_COMPOSE_FLAGS:=""}

if [[ -z "${RANDY_HOME}" ]]; then
  echo "RANDY_HOME environment variable is not set!" && exit 255
fi

# shellcheck disable=SC2068
cd "$RANDY_HOME" &&
  docker compose \
    -f docker-compose.yml ${DOCKER_COMPOSE_FLAGS} \
    --project-name randy \
    --project-directory . $@
