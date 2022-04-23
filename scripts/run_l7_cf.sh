#!/usr/bin/env sh

python3 runner.py \
  --config ~/workspace/fluxstate/warlists/l7_cf.lst \
  --debug \
  --http-methods CFB GSB \
  --threads 20
