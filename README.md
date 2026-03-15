# Caso Práctico 2

# Parte 1
Este repositorio contiene la infraestructura y configuración necesarias para desplegar el entorno utilizando Terraform y Ansible.
---
## Requisitos
Antes de ejecutar el proyecto asegúrese de tener instalado:

- Terraform
- Ansible
- Podman
- Acceso a una suscripción de Microsoft Azure
- Acceso SSH a las máquinas objetivo

## Configuración inicial
Antes de ejecutar el despliegue es necesario configurar dos archivos:

### 1. Variables de Terraform

Editar el archivo:
```
terraform/terraform.tfvars
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

Además, Terraform generará automáticamente los archivos necesarios para Ansible:

- ansible/hosts
- ansible/secrets.yml
- ansible/private_key.pem

Estos archivos se generan dinámicamente a partir de los outputs de Terraform, garantizando que siempre contengan la información actualizada de la infraestructura desplegada.
---

## 2. Configurar el servidor con Ansible

Desde la carpeta `ansible` ejecutar:

```bash
ansible-playbook -i hosts playbook.yml
```

# Reproducibilidad del sistema

Para reproducir completamente el despliegue en otra máquina únicamente es necesario:

- Configurar las variables en `terraform/terraform.tfvars`
- Ejecutar Terraform
- Ejecutar el playbook de Ansible