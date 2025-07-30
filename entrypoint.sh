#!/bin/bash

echo "Cloudflared Started.."
MODIFIED_STARTUP=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')
COMMAND=$(eval echo "${MODIFIED_STARTUP}")

exec ${FINAL_COMMAND}