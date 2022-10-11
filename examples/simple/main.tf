provider "azurerm" {
  features {}
}

locals {
  naming = {
    company = "cn"
    env     = "p"
    region  = "weu"
  }
}

module "global" {
  source = "github.com/aztfmods/module-azurerm-global"
  rgs = {
    network = {
      name     = "rg-${local.naming.company}-netw-${local.naming.env}-${local.naming.region}"
      location = "westeurope"
    }
  }
}

module "security" {
  source = "../.."

  naming = {
    company = local.naming.company
    env     = local.naming.env
    region  = local.naming.region
  }

  ddos_plan = {
    create        = true
    location      = module.global.groups.network.location
    resourcegroup = module.global.groups.network.name
  }

  depends_on = [module.global]
}