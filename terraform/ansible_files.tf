resource "local_file" "ansible_hosts" {
  content = templatefile("${path.module}/templates/hosts.tmpl", {
    vm_ip          = azurerm_public_ip.vm_public_ip.ip_address
    admin_username = var.admin_username
  })

  filename = "${path.module}/../ansible/hosts"
}

resource "local_file" "ansible_secrets" {
  content = templatefile("${path.module}/templates/secrets.yml.tmpl", {
    acr_login_server = azurerm_container_registry.acr.login_server
    acr_username     = azurerm_container_registry.acr.admin_username
    acr_password     = azurerm_container_registry.acr.admin_password
  })

  filename = "${path.module}/../ansible/secrets.yml"
}

resource "local_sensitive_file" "ansible_private_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/../ansible/private_key.pem"
  file_permission = "0600"
}