# This is where your actual code will be written


# User wants to write the terrafomr code for creting a resource group ????
# TF Mother Comes into Picture
# Terraform Registry


# resource "azurerm_resource_group" "user can edit" {
#     user cannot edit      = "user can edit"   #key = Value Pairs  
#     user cannot edit  = "user can edit"        #key = Value Pairs
# }


# Where we need the data type --> when user is inputting the data that is where we follow data Types else no data type



/*
When user wants to write any TF Code to create or modify or delete or update any resources 
Follow the below syntax

resource "terraform_resource_specification" "local_refence_name" {
    arguments = argument_values
    arguments2 = argument2_value
    arguments3 = argument3_value
    15 arguments you will have minimum 

}


user needs to enter only Local reference Name & Argument Values only 
Rest everything is already defined where user cannot modify or edit. 


resource "azurerm_resource_group" "$$$rinkesh$$$" {
    name = cpg03-batch-rg03
    location = South India
}






***Terraform WorkFlows***

1. terraform init --> To Download & Initialize the Provider Plugins and setup the modules

2. terraform validate --> this command will check/validate the code Syntax and will let us know incase of any error's

3. terraform plan --> This will generate the execution plan for the code you have written --> only Plan will be generated no action will be performed. 
    + create (green color) --> this means it will create a new resources
    - destroy (red color)  --> this will delete the resource
    ~ modify (plain color) --> this will update or modify the resource
    -/+  (Green & Red color Combination) --> This will destroy and re-create the resource due to main argument modifications


4. terraform apply --> this will create or manage the resources on cloud or code deployment. It will create or mobdify/update or delete a resources in Cloud

5. terraform destroy --> this will delete the entire infrastructure you have created using your terraform code.


*/


#Resource group Creation code
# resource "azurerm_resource_group" "example" {
#   name     = "cpg03-batch-rg02" #key = Value Pairs
#   location = "Qatar Central"    #key = Value Pairs
# }



# resource "azurerm_resource_group" "kishore_rg" {
#     name = "cpg03-batch-kishore-rg"
#     location = "east us"
# }



#Terraform Code For Virtual Network

# Arguments are basically two types
#   1. Required --> We need to mandatory pass this arguments else the terraform will throw an error missing required argument with name

#   2. Optional --> This is user desired argument, If your project needs this then you will pass else you will skip. Terraform will not throw any error. 

resource "azurerm_resource_group" "rinkesh" {
    name     = "rg-dev-cpg03-01"   #key = Value Pairs  
    location = "South India"        #key = Value Pairs
}

resource "azurerm_virtual_network" "vnet01" {
    name                = "vnet-dev-cpg03-01"   #resourcetype-environment-client-identification
    location            = azurerm_resource_group.rinkesh.location              #"South India"
    address_space       = ["10.0.0.0/24"]   #IPV4
    resource_group_name = azurerm_resource_group.rinkesh.name                  #"rg-dev-cpg03-01"     #"cpg03-batch-rg03"
}


resource "azurerm_subnet" "vm_subnet01" {
    name = "vm-subnet-dev-cpg03-01"
    resource_group_name = azurerm_resource_group.rinkesh.name        #"rg-dev-cpg03-01"     #s"cpg03-batch-rg03"
    virtual_network_name = azurerm_virtual_network.vnet01.name
    address_prefixes = ["10.0.0.0/28"] # 16 ips will be created
}


# Dependency 
# 1. Implicit --> resource reference --> resource_type.localreferencename.argument --> resource will wait till depend resource creates
# 2. Explicit



# /24 -- 256
# /25 -- 128
# /26 -- 64
# /27 -- 32
# /28 -- 16
# /29 -- 8


# Terraform Code for Creating a VM























