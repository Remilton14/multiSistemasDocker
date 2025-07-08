#!/bin/bash
# Atualiza composer.json para PHP ^8.3 e roda composer update para todos os projetos

echo "🚀 Atualizando composer.json e rodando composer update para PHP ^8.3"

for PROJECT in forbi_old forbi_atual forbi_dev forbi_stage forbi_prod
do
    echo "➡️ Atualizando $PROJECT"
    
    # Atualiza o campo "php" no composer.json (usa sed)
    sed -i 's/"php": *"[^"]*"/"php": "^8.3"/' $PROJECT/composer.json
    
    # Executa o composer update dentro do container
    docker-compose exec php bash -c "cd /var/www/$PROJECT && composer update"
done

echo "✅ Todos os projetos atualizados para PHP ^8.3!"
