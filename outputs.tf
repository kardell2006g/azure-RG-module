output "resource_group_names" {
  description = "Names of all resource groups"
  value       = azurerm_resource_group.RUSH_RG[*].name
}
