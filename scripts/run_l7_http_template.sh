#!/usr/bin/env bash

# https://github.com/porthole-ascend-cinnamon/mhddos_proxy

BASE_DIR="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"
CURRENT_DATE=$(date +%Y%m%d)
TARGETS_FILE="$BASE_DIR/../http_template/list.$CURRENT_DATE.json"

if [ -r "$TARGETS_FILE" ]; then
  LINES=$(cat $TARGETS_FILE | wc -l)
  ((THREADS=$LINES*(2**6)))

  python3 runner.py \
    --config "$TARGETS_FILE" \
    --lang en \
    --threads "$THREADS" \
    --vpn
fi
