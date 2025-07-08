
# 🚀 Forbi 4.0 - Ambiente Docker Laravel multi-projetos com SSL

Este ambiente prepara **5 projetos Laravel** com bancos de dados individuais, rodando via Docker + Nginx + MySQL + phpMyAdmin, todos com HTTPS local usando certificados autoassinados.

---

## ⚙️ Pré-requisitos

✅ Docker + Docker Compose  
✅ OpenSSL (para gerar certificados)  
✅ Linux ou Windows (com WSL recomendado para Windows)

---

## 🐳 Importante sobre o Docker

Para evitar ter que usar `sudo` o tempo todo:

```bash
sudo groupadd docker     # caso o grupo ainda não exista
sudo usermod -aG docker $USER
newgrp docker
```

✅ Assim você poderá rodar `docker ps` e `docker-compose` sem sudo.

Caso não configure o grupo `docker`, rode todos os comandos com `sudo`.

---

## 📌 Configurando o arquivo hosts

### 🐧 Linux
```bash
sudo nano /etc/hosts
```
Adicione:
```
127.0.0.1 forbi_old.local
127.0.0.1 forbi_atual.local
127.0.0.1 forbi_dev.local
127.0.0.1 forbi_stage.local
127.0.0.1 forbi_prod.local
```

### 🪟 Windows
Edite `C:\Windows\System32\drivers\etc\hosts` como administrador e adicione o mesmo conteúdo.

---

## 🔥 Primeira instalação

No Linux ou WSL:

```bash
chmod +x *.sh
```

---

## 🚀 Passo a passo

### 1️⃣ Gere certificados SSL
```bash
./generate-certs.sh
```

### 2️⃣ Confie nos certificados
```bash
./trust-certs.sh
```

### 3️⃣ Suba o ambiente completo
```bash
./setup.sh
```

Esse script:
- sobe Docker
- cria bancos
- roda migrations
- corrige permissões nos projetos

---

## 🗄️ Scripts disponíveis

✅ **update-env-db.sh**  
Atualiza todos os `.env` com:
```
DB_USERNAME=u_3467sgh_root_forbi
DB_PASSWORD=!sdgh2345WE
```

✅ **create-mysql-user-grants.sh**  
Cria o usuário MySQL `u_3467sgh_root_forbi` e dá privilégios em todos os bancos.

✅ **clear-laravel-caches.sh**  
Limpa `config`, `cache`, `route` e `view` do Laravel para todos projetos.

✅ **check-db-access.sh**  
Verifica conexão com banco em cada projeto via `php artisan migrate:status`.

✅ **fix-all-permissions.sh**  
Corrige permissões de `storage` e `bootstrap/cache` no host e no container.

---

## 🌐 Acessar o ambiente

- Laravel HTTPS:
```
https://forbi_old.local:8443
https://forbi_atual.local:8443
https://forbi_dev.local:8443
https://forbi_stage.local:8443
https://forbi_prod.local:8443
```

- phpMyAdmin:
```
http://localhost:8081
```
User: `root` ou `u_3467sgh_root_forbi`  
Senha: `!sdgh2345WE`

---

## 🚀 Docker básico

- Subir containers:
```bash
docker-compose up -d
```

- Parar containers:
```bash
docker-compose down
```

- Verificar containers:
```bash
docker ps
```

---

✅ Ambiente pronto!
Se quiser, posso gerar um `diagnostic.sh` para testar permissões, grupo `docker` e containers. É só pedir 🚀
