

#resource group
resource "azurerm_resource_group" "state_rg01" {
  name = var.state_rg01_name
  location = var.location
}

resource "azurerm_resource_group" "state_rg02" {
  name = var.state_rg02_name
  location = var.state_rg02_location
}

resource "azurerm_resource_group" "state_rg11" {
  name = "rg-state-poc-11"
  location = var.location
}

# resource "azurerm_resource_group" "state_rg22" {
#   name = "rg-state-poc-22"
#   location = var.location
# }

# resource "azurerm_resource_group" "state_rg33" {
#   name = "rg-state-poc-33"
#   location = var.location
# }

# resource "azurerm_resource_group" "state_rg44" {
#   name = "rg-state-poc-44"
#   location = var.location
# }

# resource "azurerm_resource_group" "state_rg55" {
#   name = "rg-state-poc-55"
#   location = var.location
# }

resource "azurerm_resource_group" "state_rg66" {
  name = "rg-state-poc-66"
  location = var.location
}


# 100 rESOURC?E GROUPS

#-target

# Command Flag

# terraform destroy -target=resourcetype.localreferencename


/*

we have created 6 files

after running the code
we hae 9 files and folder

.terraform.lock.hcl --> Automatic creation and This is your provider version locker --> Provider version constraint
This file will lock the version downupgrading, You cannot downgrade a provider versions



.terraform folder is also created


**Remote State**

The State file will be stored under Azure Storage account or Blob storage
AWS --> Dynamo DB to store the State file

https://developer.hashicorp.com/terraform/language/backend/azurerm#example-configuration-4


Terraform Remote Backend Configuration
terraform {
  backend "azurerm" {
    access_key           = "abcdefghijklmnopqrstuvwxyz0123456789..."  # Can also be set via `ARM_ACCESS_KEY` environment variable.
    storage_account_name = "abcd1234"                                 # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                                  # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prod.terraform.tfstate"                   # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

*/