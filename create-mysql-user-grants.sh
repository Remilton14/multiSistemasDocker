#!/bin/bash
# Cria usuário MySQL e concede privilégios para todos os bancos dos projetos Laravel

echo "🚀 Criando usuário MySQL e concedendo privilégios para todos os bancos..."

docker-compose exec mysql bash -c "mysql -uroot -proot <<EOF
CREATE USER IF NOT EXISTS 'u_3467sgh_root_forbi'@'%' IDENTIFIED BY '!sdgh2345WE';
GRANT ALL PRIVILEGES ON u_3467sgh_forbi_old.* TO 'u_3467sgh_root_forbi'@'%';
GRANT ALL PRIVILEGES ON u_3467sgh_forbi_atual.* TO 'u_3467sgh_root_forbi'@'%';
GRANT ALL PRIVILEGES ON u_3467sgh_forbi_dev.* TO 'u_3467sgh_root_forbi'@'%';
GRANT ALL PRIVILEGES ON u_3467sgh_forbi_stage.* TO 'u_3467sgh_root_forbi'@'%';
GRANT ALL PRIVILEGES ON u_3467sgh_forbi_prod.* TO 'u_3467sgh_root_forbi'@'%';
FLUSH PRIVILEGES;
EOF
"

echo "✅ Usuário e privilégios configurados com sucesso!"
