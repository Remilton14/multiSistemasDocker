#!/bin/bash
for SITE in forbi_old forbi_atual forbi_dev forbi_stage forbi_prod
do
    echo "🔧 Gerando certificado para $SITE.local"
    mkdir -p certs/$SITE.local
    openssl req -x509 -nodes -days 365 -newkey rsa:2048         -keyout certs/$SITE.local/$SITE.local.key         -out certs/$SITE.local/$SITE.local.crt         -subj "/C=BR/ST=SP/L=Local/O=Dev/OU=Dev/CN=$SITE.local"
done
echo "✅ Certificados gerados em ./certs"
