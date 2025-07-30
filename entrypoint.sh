#!/bin/bash
echo "Cloudflared Started.."

for i in {1..10}; do
  if [[ -n "$STARTUP" ]]; then
    eval "$STARTUP"
    exit 0
  fi
  sleep 1
done

exit 1