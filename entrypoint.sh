#!/bin/bash
# Script de entrada para cloudflared

# Exporta la variable de certificado de origen si es necesario
export TUNNEL_ORIGIN_CERT=/home/container/cert.pem

# Mantén el contenedor en ejecución y da acceso a la consola
/bin/bash