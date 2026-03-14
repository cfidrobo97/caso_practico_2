# Caso Práctico 2
Este repositorio contiene la infraestructura y configuración necesarias para desplegar el entorno utilizando Terraform y Ansible.
---
## Requisitos
Antes de ejecutar el proyecto asegúrese de tener instalado:

- Terraform
- Ansible
- OpenSSL
- Acceso SSH a las máquinas objetivo

## Configuración de llaves SSH
Para permitir que **Ansible** se conecte a los servidores, debe generar un par de llaves SSH y colocar la llave privada en la carpeta:

```
ansible/
```

con el nombre:

```
private_key.pem
```

Luego asigne los permisos correctos:

```bash
chmod 400 ansible/private_key.pem
```

---
## Generación del certificado SSL
Ejecute el siguiente comando para generar un certificado autofirmado que será utilizado por el servidor:

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout server.key \
-out server.crt \
-subj "/C=EC/ST=Imbabura/L=Atuntaqui/O=UNIR/OU=DevOps/CN=localhost"
```

Esto generará:

- `server.key` → llave privada
- `server.crt` → certificado SSL


## Ejecución del proyecto

### 1. Desplegar infraestructura con Terraform

```bash
terraform init
terraform plan
terraform apply
```

### 2. Configurar servidores con Ansible

```bash
ansible-playbook -i inventory playbook.yml
```