#!/bin/bash
# Script para rodar migrations do Laravel em todos os sistemas

echo "🚀 Rodando migrations para todos os sistemas Laravel..."

for dir in forbi_old forbi_atual forbi_dev forbi_stage forbi_prod
do
    echo "➡️ Rodando migrations em $dir..."
    docker-compose exec php bash -c "cd /var/www/$dir && php artisan migrate --force"
done

echo "✅ Todas as migrations concluídas!"
