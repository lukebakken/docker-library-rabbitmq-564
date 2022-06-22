#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

export DOCKER_BUILDKIT=1

git submodule update --init

(cd ./tls-gen && git clean -xffd)

make -C ./tls-gen/basic CN=localhost

docker build --tag docker-library-564:latest .
