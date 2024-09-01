#!/bin/sh
[[ ! -x $(command -v mitmproxy) ]] && echo "The package 'mitmproxy' is required" && exit 1;
cd "$(dirname "$0")"
trap 'pkill -9 mitmdump' SIGINT
worlds=""
for W in {1..10}; do
  port="90$(printf "%02d" $W)"
  worlds="${worlds} --mode reverse:https://w$W-2004.lostcity.rs@$port"
done
mitmdump --listen-host 0.0.0.0 $worlds -s spoof_origin.py &
npm run build:prod
npx http-server -a localhost -p 8080 -c-1 --cors
pkill -9 mitmdump
