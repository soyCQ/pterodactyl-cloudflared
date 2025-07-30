#!/bin/bash
echo "Cloudflared Started.."

# Espera a que la variable STARTUP esté definida (máximo 10 intentos)
for i in {1..10}; do
  if [[ -n "$STARTUP" ]]; then
    eval "$STARTUP"
    exit 0
  fi
  sleep 1
done

exit 1