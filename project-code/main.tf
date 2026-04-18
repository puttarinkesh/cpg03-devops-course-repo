
# #I want to create this VM in existing Vnet and Resource Group

# # There are two ways to pass the values of existing resources in Azure
# #Variable Passing 
# #Data Sources

# # Resource group:cpg-02-infra-dev
# # Location:West Europe

# # data "azurerm_subnet" "existing" {
# #   name                 = "subnet1"
# #   virtual_network_name = "cpg-02-infra-dev-network"
# #   resource_group_name  = "cpg-02-infra-dev"
# # }

# data "azurerm_resource_group" "existing_rg" {
#   name = "cpg-02-infra-dev"
# }


# # #Network interface card (NIC)
# # resource "azurerm_network_interface" "vm_nic01" {
# #   name = var.vm_nic01_name
# #   resource_group_name = data.azurerm_subnet.existing.resource_group_name
# #   location = "West Europe"

# #     ip_configuration {
# #         name = var.vm_nic01_ip_conf_name
# #         private_ip_address_allocation = "Dynamic"
# #         subnet_id = data.azurerm_subnet.existing.id
# #     }
# # }

# # #VM
# # resource "azurerm_windows_virtual_machine" "vm01" {
# #   name = var.vm01_name
# #   location = data.azurerm_resource_group.existing_rg.location   #we need to observe
# #   resource_group_name = data.azurerm_subnet.existing.resource_group_name
# #   network_interface_ids = [azurerm_network_interface.vm_nic01.id]
# #   computer_name = var.vm01_computer_name
# #   size = "Standard_B1s"

# #   admin_username = var.vm01_admin_username
# #   admin_password = var.vm01_admin_password

# #   os_disk {
# #     caching = "ReadWrite"
# #     storage_account_type = "StandardSSD_LRS"
# #     disk_size_gb = 300
# #   }

# #   source_image_reference {
# #     publisher = "MicrosoftWindowsServer"
# #     offer = "WindowsServer"
# #     sku = "2016-Datacenter"
# #     version = "latest"
# #   }
# # }

# #How  to Manage the Existing resources using terraform
# #Terraform Import

# #Existing Vnet - Now we want to manage using Terraform
# # Process 
# # 1. First User has to write the code of the resource
# # 2. Run the Import Command to bring the resource into state file
# # 3. You should be able to manage now


# resource "azurerm_virtual_network" "vnet01" {
#     name                = "cpg-02-infra-dev-network"
#     location            = data.azurerm_resource_group.existing_rg.location
#     address_space       = ["10.0.0.0/16"]
#     resource_group_name = data.azurerm_resource_group.existing_rg.name
#     dns_servers         = []
# }

# # terraform import azurerm_virtual_network.exampleNetwork /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Network/virtualNetworks/myvnet1


# # terraform import azurerm_virtual_network.vnet01 "/subscriptions/0f87b7f3-b8ff-4c25-b09a-901f6869202e/resourceGroups/cpg-02-infra-dev/providers/Microsoft.Network/virtualNetworks/cpg-02-infra-dev-network"


# #**********************************************************************************************************
# #***14-04-2026

# #Terraform Meta Arguments are useful to control the default behaviour of Terraform

# /*

# There are total 5 Meta Arguments
# 1. depends_on meta argument  --> Explicit Dependency 
# 2. provider meta argument    --> backend configuration 
# 3. count meta argument       --> Count is used to create multiple identical resources
# 4. for_each meta argument    --> For_each is used to create multiple resources with diff. diff configurations. 
# 5. life_cycle meta argument  --> Life_cycle is used to change the default behaviour of Terraform functionality
#       1. ignore_changes
#       2. prevent_destroy
#       3. create_before_destroy
       
# */


# #Looping --> I want 5 storage accounts then it will run for 5 times to create those 5 stroage accounts
# #Count -- Create 5 storage accounts, South India, LRS, 

resource "azurerm_resource_group" "new_rg" {
  name = "cpg-03-infra-dev"
  location = "south india"
}

# # Count Meta Argument
# # resource "azurerm_storage_account" "example" {
# #   count                    = 5
# #   name                     = "stocountmetaargu${count.index}" #count object count.index 0 1 2 3 4 
# #   resource_group_name      = azurerm_resource_group.new_rg.name
# #   location                 = azurerm_resource_group.new_rg.location
# #   account_tier             = "Standard"
# #   account_replication_type = "GRS"

# #   tags = {
# #     environment = "staging"
# #   }

# #   lifecycle {
# #     ignore_changes = [  ]
# #   }
# # }



# #Life Cycle Meta Argument
# # resource "azurerm_storage_account" "lifecycle" {
# #   name                     = "stocountmetaargu008"
# #   resource_group_name      = azurerm_resource_group.new_rg.name
# #   location                 = azurerm_resource_group.new_rg.location
# #   account_tier             = "Standard"
# #   account_replication_type = "GRS"   #--> desired configuration

# #   tags = {
# #     environment = "staging"
# #   }

# #   #ignore Changes
# #   lifecycle {
# #     ignore_changes = [
# #       account_replication_type,
# #       tags
# #     ]
# #   }
# # }


# #Prevent From Destroy
# # At Any Cost We should not delete this storage account 
# # resource "azurerm_storage_account" "lifecycle_prevent_destroy" {
# #   name                     = "stodatabasemanualbac009"
# #   resource_group_name      = azurerm_resource_group.new_rg.name
# #   location                 = azurerm_resource_group.new_rg.location
# #   account_tier             = "Standard"
# #   account_replication_type = "GRS"   #--> desired configuration

# #   tags = {
# #     environment = "staging"
# #   }

# #   #Prevent From Destroy

# #   lifecycle {
# #     prevent_destroy = true     #boolean value
# #   }

# # }



# # create_before_destroy
# # resource "azurerm_storage_account" "create_before_destroy" {
# #   name                     = "stocreatebeforedes001"
# #   resource_group_name      = azurerm_resource_group.new_rg.name
# #   location                 = azurerm_resource_group.new_rg.location
# #   account_tier             = "Standard"
# #   account_replication_type = "GRS"   #--> desired configuration

# #   tags = {
# #     environment = "staging"
# #   }


# #   lifecycle {
# #     create_before_destroy = true #boolean value
# #   }
# # }


# #For_Each for multiple resources with diff. diff. configurations
# # Two Types
# # 1. Set of strings     --> List Example ["r1", "r2", "r1", "r3"] [1, 2, 4, 1, 2, 6, 8]
# # Set is used for unique values in given user data["r1", "r2", "r3"]

# # 2. map

# #Example Set of Strings
# # Four Storage Accounts
# # east, west, south, north
# #toset()

# # east us
# # west us
# # south india
# # north europe

# # {}  -- > Curl brackets
# # []  -- > square brackets
# # ()  -- > paranthesis

# # { "east"; "west"; "south"; "north" }

# resource "azurerm_storage_account" "for_each_set_of_strings" {
#   for_each                 = toset(var.storage_names)
#   name                     = "stoforeachset${each.key}"
#   resource_group_name      = azurerm_resource_group.new_rg.name
#   location                 = azurerm_resource_group.new_rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"   #--> desired configuration

#   tags = {
#     environment = "staging"
#   }
# }


# # map
# # {
# #   KEY       = VALUE         --> KEY = VALUE PAIR
# #   "rinkesh" = "trainer",    --> KEY = VALUE PAIR
# #   "rajesh"  = "student01",  --> KEY = VALUE PAIR
# #   "sandeep" = "student02",  --> KEY = VALUE PAIR
# #   "awinish" = "student03"   --> KEY = VALUE PAIR
# # }


# # # Power of Key 
# # {
# #   KEY       = VALUE         --> KEY = VALUE PAIR
# #   "name" =  "rajesh" 
# #   "company" = "delloittee" 
# #   "location" = "hyderabad"
# #   "occupation" = "software engineer"
# #   "phone" = "xxxxxxx"
# # }






# resource "azurerm_storage_account" "for_each_map" {
#   for_each                 = tomap({
#     "east"   = "east us",
#     "west"   = "west us",
#     "south"  = "south india"
#     "north"  = "north europe"
#   })
#   name                     = "stoforeachset${each.key}"
#   resource_group_name      = azurerm_resource_group.new_rg.name
#   location                 = "${each.value}"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"   #--> desired configuration

#   tags = {
#     environment = "staging"
#   }
# }




# if a = b ? then print a otherwise print b

# if a = b ? a : b

# 10 = 15 ? 10 : 15


# if a = b == true ? a : b


# location = "eastus" ? deploy : dont deploy

# if location is 'east us' then I dont want deploy the storage account otherwise I want deploy the 3 storage account



resource "azurerm_storage_account" "conditional_expressions" {
  count                    = var.location == "east us" ? 0 : 3 #ignored
  name                     = "stoforeachset"
  resource_group_name      = azurerm_resource_group.new_rg.name
  location                 = var.location
  account_tier             = "Premium"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}




# Standard or Premium

# if location is 'east us' then I want Premium tier otherwise I want standard tier

# location == eastus ? Premium : standard



# Conditional expression with Meta Arguments

# if location is 'east us' then I want deploy the storage account otherwise I dont want deploy the storage account


# if location is 'east us' then I dont want deploy the storage account otherwise I want deploy the 3 storage account


# location == eastus ? count == 1 : 3


/*

# Terraform Comments

Single line comment     --> # or //
Multi Line comments      -->   /*  



# to ignore anything from that particular point. 



 Kishore is our class member and also rajesh is a member #but prashant is not a member

 */