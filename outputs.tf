output "ddos_plan_id" {
  value = one(azurerm_network_ddos_protection_plan.ddos_plan[*].id)
}

# output "route53_private_prod" {
#   value = one(aws_route53_zone.private[*].zone_id)
# }