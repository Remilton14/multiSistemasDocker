#!/bin/bash
# Atualiza DB_USERNAME e DB_PASSWORD nos arquivos .env de todos os projetos

echo "🔧 Atualizando credenciais DB nos .env de todos os projetos..."

for PROJECT in forbi_old forbi_atual forbi_dev forbi_stage forbi_prod
do
    ENV_FILE="$PROJECT/.env"
    if [ -f "$ENV_FILE" ]; then
        echo "➡️ Atualizando $ENV_FILE"
        sed -i 's/^DB_USERNAME=.*/DB_USERNAME=u_3467sgh_root_forbi/' "$ENV_FILE"
        sed -i 's/^DB_PASSWORD=.*/DB_PASSWORD=!sdgh2345WE/' "$ENV_FILE"
    else
        echo "⚠️ Arquivo $ENV_FILE não encontrado, pulando."
    fi
done

echo "✅ Credenciais atualizadas com sucesso em todos os projetos!"
