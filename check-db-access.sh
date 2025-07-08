#!/bin/bash
# Checa se o Laravel consegue acessar o banco em cada projeto usando migrate:status

echo "🚀 Verificando acesso ao banco de dados via Laravel..."

for PROJECT in forbi_old forbi_atual forbi_dev forbi_stage forbi_prod
do
    echo "➡️ Testando conexão para $PROJECT"
    docker-compose exec php bash -c "cd /var/www/${PROJECT} && php artisan migrate:status" || echo "❌ Falha ao acessar o DB para $PROJECT"
done

echo "✅ Verificação concluída!"
