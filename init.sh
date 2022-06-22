#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

export DOCKER_BUILDKIT=1

git submodule update --init

(cd ./tls-gen && git clean -xffd)

make -C ./tls-gen/basic CN=localhost

docker build --tag docker-library-564:latest .

docker run --rm --publish 5672:5672 \
    --publish 5671:5671 \
    --publish 15672:15672 \
    --publish 15671:15671 docker-library-564:latest
