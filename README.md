# Caso Práctico 2
Este repositorio contiene la infraestructura y configuración necesarias para desplegar el entorno utilizando Terraform y Ansible.
---
## Requisitos
Antes de ejecutar el proyecto asegúrese de tener instalado:

- Terraform
- Ansible
- Acceso a una suscripción de Microsoft Azure
- Acceso SSH a las máquinas objetivo

## Configuración inicial
Antes de ejecutar el despliegue es necesario configurar dos archivos:

### 1. Variables de Terraform

Editar el archivo:
```
terraform/terraform.tfvars
```
### 2. Credenciales de aplicación

Editar el archivo:
```
ansible/secrets.yml
```
# Ejecución del proyecto

## 1. Desplegar infraestructura con Terraform

Desde la carpeta `terraform` ejecutar:

```bash
terraform init
terraform plan
terraform apply
```

Esto creará automáticamente:

- Resource Group
- Red virtual
- Subred
- Security Group
- IP pública
- Máquina virtual Linux
- Azure Container Registry

---

## 2. Generar la clave SSH para Ansible

Una vez finalizado el despliegue, generar la clave privada SSH utilizada por Ansible ejecutando:

```bash
terraform output -raw ssh_private_key > ../ansible/private_key.pem
chmod 600 ../ansible/private_key.pem
```

Esto guardará la clave privada dentro de la carpeta `ansible/`.

---

## 3. Obtener la IP pública de la máquina virtual

Ejecutar:

```bash
terraform output -raw vm_public_ip
```

Copiar la IP obtenida y actualizar el archivo:

```
ansible/hosts
```

reemplazando la IP pública de la máquina virtual.

---

## 4. Configurar el servidor con Ansible

Desde la carpeta `ansible` ejecutar:

```bash
ansible-playbook -i hosts playbook.yml
```

# Reproducibilidad del sistema

Para reproducir completamente el despliegue en otra máquina únicamente es necesario:

- Configurar las variables en `terraform/terraform.tfvars`
- Configurar las credenciales en `ansible/secrets.yml`
- Ejecutar Terraform
- Generar la clave SSH
- Actualizar la IP pública en `ansible/hosts`
- Ejecutar el playbook de Ansible