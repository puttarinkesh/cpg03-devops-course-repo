

#whwer is the concept of re-usability ?

#Terraform has introduced Modules.
# I need to call the storage account module code 
#  would like to re-use it instead of writing the new code


# module "user_defined_name" {}    ==> Default Syntax

module "dev_stor_acc" {
  source                                   = "../azure_storage_account" #SPECIFY ROOT CODE PATH
  storage_account_name                     = "blackrockdev001"
  storage_account_resource_group_name      = "cpg-03-black-rock-infra"
  storage_account_location                 = "west europe"
  storage_account_account_tier             = "Standard"
  storage_account_account_replication_type = "LRS"
  storage_container_name                   = "black-rock-images-upload"
  tags = {
    environmnet  = "dev"
    architect    = "kishore"
    project_code = "985687"
  }
}


module "production_stor_acc" {
  source                                   = "../azure_storage_account" #SPECIFY ROOT CODE PATH
  storage_account_name                     = "blackrockproduction001"
  storage_account_resource_group_name      = "cpg-03-black-rock-infra"
  storage_account_location                 = "eastus2"
  storage_account_account_tier             = "Premium"
  storage_account_account_replication_type = "LRS"
  storage_container_name                   = "black-rock-images-upload"
  tags = {
    environmnet  = "production"
    architect    = "kishore"
    project_code = "985687"
  }
}


#RG MODULE CODE 

module "resource_group_dummy" {
  source                  = "../azure_resource_group"
  resource_group_name     = "dummy-resources-place"
  resource_group_location = "south india"
  tags = {
    environmnet  = "production"
    architect    = "kishore"
    project_code = "985687"
  }
}


