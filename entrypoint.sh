#!/bin/bash
echo "Cloudflared Started.."
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
${MODIFIED_STARTUP}