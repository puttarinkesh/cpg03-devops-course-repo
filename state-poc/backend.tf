
terraform {
    backend "azurerm" {
      resource_group_name = "kpmg-poc"
      storage_account_name = "kpmgdefenderscan"
      container_name = "cpg03-tf-state"
      key = "dev-cpg03-poc.tfstate"
      #key = "terraform.tfstate" #name you want to keep for state file --> User Defined Key Can be given
    }
}