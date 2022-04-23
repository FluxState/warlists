#!/usr/bin/env sh

python3 runner.py \
  --config ~/workspace/fluxstate/warlists/l7_apache.lst \
  --debug \
  --http-methods APACHE GSB \
  --threads 32 \
  --vpn 100
