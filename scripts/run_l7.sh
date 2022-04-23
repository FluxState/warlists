#!/usr/bin/env sh

python3 runner.py \
  --config ~/workspace/fluxstate/warlists/l7.lst \
  --debug \
  --http-methods GSB \
  --threads 292 \
  --vpn 100
