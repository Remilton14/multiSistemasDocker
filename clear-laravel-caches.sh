#!/bin/bash
# Limpa caches do Laravel (config, cache, route, view) para todos os projetos

echo "🚀 Limpando todos os caches do Laravel em todos os projetos..."

for PROJECT in forbi_old forbi_atual forbi_dev forbi_stage forbi_prod
do
    echo "➡️ Limpando caches em $PROJECT"
    docker-compose exec php bash -c "cd /var/www/${PROJECT} && php artisan config:clear && php artisan cache:clear && php artisan route:clear && php artisan view:clear"
done

echo "✅ Todos os caches foram limpos!"
