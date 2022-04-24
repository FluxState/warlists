#!/usr/bin/env sh

python3 runner.py \
  --config https://raw.githubusercontent.com/FluxState/warlists/main/l7_get-stress.lst \
  --debug \
  --http-methods GET STRESS \
  --threads 12 \
  --vpn 90
