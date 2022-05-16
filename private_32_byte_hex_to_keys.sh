#!/usr/bin/env bash

# $1 replace first argument with something like `openssl rand -hex 32` output

echo "302e0201010420$1a00706052b8104000a" | xxd -r -p | openssl ec -inform d > private_only.pem
