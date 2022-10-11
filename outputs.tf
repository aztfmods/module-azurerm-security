output "ddos_plan_id" {
  value = one(azurerm_network_ddos_protection_plan.ddos_plan[*].id)
}