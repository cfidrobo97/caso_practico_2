variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "westus3"
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
  default     = "rg-casopractico2"
}

variable "vm_name" {
  description = "Virtual Machine name"
  type        = string
  default     = "vm-casopractico2"
}

variable "admin_username" {
  description = "Admin username for VM"
  type        = string
  default     = "azureuser"
}

variable "acr_name" {
  description = "Azure Container Registry name"
  type        = string
}

variable "aks_name" {
  description = "AKS cluster name"
  type        = string
  default     = "aks-casopractico2"
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    environment = "casopractico2"
  }
}