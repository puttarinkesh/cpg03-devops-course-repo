# This is where your actual code will be written


# User wants to write the terrafomr code for creting a resource group ????
# TF Mother Comes into Picture
# Terraform Registry


#Resource group Creation code
resource "azurerm_resource_group" "example" {
  name     = "cpg03-batch-rg02" #key = Value Pairs
  location = "Qatar Central"    #key = Value Pairs
}

resource "azurerm_resource_group" "$$$rinkesh$$$" {
    name     = "cpg03-batch-rg03"   #key = Value Pairs  
    location = "South India"        #key = Value Pairs
}



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




*/

