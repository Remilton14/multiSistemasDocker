#!/bin/bash
# Adiciona todos os certificados gerados localmente ao trusted store do Linux

echo "🔧 Instalando certificados autoassinados no sistema..."

for SITE in forbi_old forbi_atual forbi_dev forbi_stage forbi_prod
do
    CERT="certs/$SITE.local/$SITE.local.crt"
    if [ -f "$CERT" ]; then
        echo "➡️ Instalando $CERT como autoridade confiável"
        sudo cp "$CERT" "/usr/local/share/ca-certificates/$SITE.local.crt"
    else
        echo "⚠️ Certificado $CERT não encontrado, pulando."
    fi
done

echo "🔄 Atualizando repositório de CAs confiáveis..."
sudo update-ca-certificates

echo "✅ Certificados instalados. Reinicie o navegador para efeito."
