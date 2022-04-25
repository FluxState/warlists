#!/usr/bin/env sh

python3 runner.py \
  --config https://raw.githubusercontent.com/FluxState/warlists/main/l7_cf.lst \
  --debug \
  --http-methods CFB GSB \
  --threads 96
