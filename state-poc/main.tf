

#resource group
resource "azurerm_resource_group" "state_rg01" {
  name = var.state_rg01_name
  location = var.location
}


resource "azurerm_resource_group" "state_rg02" {
  name = "rg-state-after-37-row"
  location = "south india"
}



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

*/