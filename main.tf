#----------------------------------------------------------------------------------------
# Resourcegroups
#----------------------------------------------------------------------------------------

data "azurerm_resource_group" "rg" {
  name = var.ddos_plan.resourcegroup
}

#----------------------------------------------------------------------------------------
# ddos protection plan
#----------------------------------------------------------------------------------------

resource "azurerm_network_ddos_protection_plan" "ddos_plan" {
  count   = var.ddos_plan.create ? 1 : 0

  name                = "plan-ddos-${var.naming.company}-${var.naming.env}-${var.naming.region}"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
}