output "vm_public_ip" {
  value = azurerm_public_ip.vm_public_ip.ip_address
}

output "vm_admin_username" {
  value = var.admin_username
}

output "ssh_private_key" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_name" {
  value = azurerm_container_registry.acr.name
}

output "acr_admin_username" {
  value = azurerm_container_registry.acr.admin_username
}

output "acr_admin_password" {
  value     = azurerm_container_registry.acr.admin_password
  sensitive = true
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_kube_config_command" {
  value = "az aks get-credentials --resource-group ${azurerm_resource_group.rg.name} --name ${azurerm_kubernetes_cluster.aks.name} --overwrite-existing"
}