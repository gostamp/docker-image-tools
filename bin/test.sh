#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

APP_REGISTRY="${APP_REGISTRY:?}"
APP_NAME="${APP_NAME:?}"
APP_TAG="${APP_TAG?}"

image="${APP_REGISTRY}/${APP_NAME}:${APP_TAG}"

echo ""
echo "[test] container-structure-test"
container-structure-test test \
    --config "/app/tests/structure-test.yaml" \
    --image "${image}"

echo ""
echo "[test] dive"
dive --ci "${image}"

echo ""
echo "DONE"
echo ""
