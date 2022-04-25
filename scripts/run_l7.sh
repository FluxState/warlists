#!/usr/bin/env sh

python3 runner.py \
  --config https://raw.githubusercontent.com/FluxState/warlists/main/l7.lst \
  --debug \
  --http-methods GSB \
  --threads 332 \
  --vpn 90
