#!/bin/sh
[[ ! -x $(command -v npm) ]] && echo "The package 'npm' is required" && exit 1;
cd "$(dirname "$0")"
./update_client_keys.sh &
npm install
npm run asc
echo "Setup complete"
