#!/bin/bash
echo "🚀 Gerando certificados SSL auto-assinados..."
./generate-certs.sh

echo "🐳 Subindo containers Docker..."
docker-compose up -d --build

echo "⏳ Aguardando o MySQL iniciar..."
sleep 15

echo "🔧 Corrigindo permissões em todos os projetos..."
for PROJECT in forbi_old forbi_atual forbi_dev forbi_stage forbi_prod
do
    sudo chown -R $USER:$USER ${PROJECT}/storage ${PROJECT}/bootstrap/cache
    sudo chmod -R 775 ${PROJECT}/storage ${PROJECT}/bootstrap/cache
    docker-compose exec php bash -c "chmod -R 775 /var/www/${PROJECT}/storage /var/www/${PROJECT}/bootstrap/cache && chown -R www-data:www-data /var/www/${PROJECT}/storage /var/www/${PROJECT}/bootstrap/cache"
done

echo "🗄️ Criando bancos no MySQL..."
docker exec -i mysql mysql -uroot -proot <<EOF
CREATE DATABASE IF NOT EXISTS u_3467sgh_forbi_old;
CREATE DATABASE IF NOT EXISTS u_3467sgh_forbi_atual;
CREATE DATABASE IF NOT EXISTS u_3467sgh_forbi_dev;
CREATE DATABASE IF NOT EXISTS u_3467sgh_forbi_stage;
CREATE DATABASE IF NOT EXISTS u_3467sgh_forbi_prod;
EOF

echo "📂 Rodando migrations em todos os projetos..."
for PROJECT in forbi_old forbi_atual forbi_dev forbi_stage forbi_prod
do
    docker-compose exec php bash -c "cd /var/www/${PROJECT} && php artisan migrate --force"
done

echo "✅ Setup completo! Acesse https://forbi_old.local:8443"
