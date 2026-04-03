# This is where your actual code will be written


# User wants to write the terrafomr code for creting a resource group ????
# TF Mother Comes into Picture
# Terraform Registry


#Resource group Creation code
resource "azurerm_resource_group" "example" {
  name     = "cpg03-batch-rg02" #key = Value Pairs
  location = "Qatar Central"    #key = Value Pairs
}

resource "azurerm_resource_group" "rinkesh" {
    name     = "cpg03-batch-rg03"   #key = Value Pairs  
    location = "South India"        #key = Value Pairs
}


resource "azurerm_resource_group" "kishore_rg" {
    name = "cpg03-batch-kishore-rg"
    location = "east us"
}






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




