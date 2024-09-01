#!/bin/sh
cd "$(dirname "$0")"
mkdir -p public
for W in {1..10}; do
  curl -s "https://w$W-2004.lostcity.rs/client/client.js" | grep -oP '(?<=static zO=BigInt\(").*?(?=")' > public/clientkey_$W
done
