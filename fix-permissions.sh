#!/bin/bash
# Corrige permissões das pastas necessárias no Laravel (storage e bootstrap/cache)

echo "🔧 Corrigindo permissões para Laravel..."

# Diretório base (mude se necessário)
PROJECT_DIR=${1:-forbi_old}

# Permissões no host
echo "🛠️ Aplicando chown e chmod no host para ${PROJECT_DIR}..."
sudo chown -R $USER:$USER ${PROJECT_DIR}/storage ${PROJECT_DIR}/bootstrap/cache
sudo chmod -R 775 ${PROJECT_DIR}/storage ${PROJECT_DIR}/bootstrap/cache

# Permissões dentro do container
echo "🐳 Aplicando permissões dentro do container Docker..."
docker-compose exec php bash -c "chmod -R 775 /var/www/${PROJECT_DIR}/storage /var/www/${PROJECT_DIR}/bootstrap/cache && chown -R www-data:www-data /var/www/${PROJECT_DIR}/storage /var/www/${PROJECT_DIR}/bootstrap/cache"

echo "✅ Permissões corrigidas para ${PROJECT_DIR}!"
