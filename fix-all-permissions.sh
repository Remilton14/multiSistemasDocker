#!/bin/bash
# Corrige permissões das pastas storage e bootstrap/cache em TODOS os projetos Laravel

echo "🔧 Corrigindo permissões para todos os projetos Laravel..."

for PROJECT in forbi_old forbi_atual forbi_dev forbi_stage forbi_prod
do
    echo "➡️ Corrigindo permissões no host para ${PROJECT}..."
    sudo chown -R $USER:$USER ${PROJECT}/storage ${PROJECT}/bootstrap/cache
    sudo chmod -R 775 ${PROJECT}/storage ${PROJECT}/bootstrap/cache

    echo "🐳 Corrigindo permissões no container Docker para ${PROJECT}..."
    docker-compose exec php bash -c "chmod -R 775 /var/www/${PROJECT}/storage /var/www/${PROJECT}/bootstrap/cache && chown -R www-data:www-data /var/www/${PROJECT}/storage /var/www/${PROJECT}/bootstrap/cache"
done

echo "✅ Todas as permissões foram corrigidas!"
