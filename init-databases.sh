#!/bin/bash
echo "Criando bancos no MySQL..."

docker exec -i mysql mysql -uroot -proot <<EOF
CREATE DATABASE IF NOT EXISTS u_3467sgh_forbi_old;
CREATE DATABASE IF NOT EXISTS u_3467sgh_forbi_atual;
CREATE DATABASE IF NOT EXISTS u_3467sgh_forbi_dev;
CREATE DATABASE IF NOT EXISTS u_3467sgh_forbi_stage;
CREATE DATABASE IF NOT EXISTS u_3467sgh_forbi_prod;
EOF

echo "Bancos criados com sucesso!"
