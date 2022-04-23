#!/usr/bin/env bash

readonly WEBSITES=$(cat "$1")

for url in $WEBSITES; do
  scheme="$(echo "$url" | sed -e's,^\(.*://\).*,\1,g')"
  domain="$(echo "$url" | sed -e 's|^[^/]*//||' -e 's|/.*$||')"
  real_ip="$(dig +short @77.88.8.88 A "$domain" | head -n1)"
  real_url="$scheme$real_ip"
  sleep 1
  result="$(curl -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4896.127 Safari/537.36' -k --silent -v --connect-timeout 5 --max-time 10 "$real_url" --stderr - | grep -i 'server:')"
  if [ -z "$result" ]; then
    result_out='?'
  else
    read -ra result <<< "$result"
    result_out="${result[2]}"
  fi
  echo "$url -> $real_url :: $result_out"
done
