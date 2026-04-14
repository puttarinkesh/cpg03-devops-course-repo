# This is Variable declaration file

# For the main file all the variables will be added over here 


#Syntax for Variables

variable "variable_name" {
    description = "Specify the variable descripton"
    type = string   #Specify the variable data type
    default = "value" #Specify the value you want to use
}


#Frontend Variables
variable "frontend_subnet01_name" {
    description = "This is a subnet name for frontend"
    type = string
    default = "rinkesh-subnet-dev-cpg03-01"
}

variable "frontend_subnet01_rinkesh" {
  description = "This is a frontend subnet address prefix or address space "
  type = list
  default =  ["10.0.0.48/28"]
}

#Virtual Network 
variable "vnet01_name" {
    description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
    type = string   #Specify the variable data type
    default = ""
}

variable "vnet01_address_spaces" {
    description = "(Optional) The address space that is used the virtual network. You can supply more than one address space."
    type = list   #Specify the variable data type
    default = [""] #Specify the value you want to use
}

#Virtual Machine Variables
variable "vm01_name" {
    description = ""
    type = string
    default = "app-vm-dev-cpg03-01"
}
variable "vm01_computer_name" {
    description = ""
    type = string
    default = "app-vm-dev-01"
}

variable "vm01_size" {
    description = ""
    type = string
    default = "Standard_DS2_v2"
}

variable "vm01_admin_username" {
    description = ""
    type = string
    default = "adminuser"
}

variable "vm01_admin_password" {
    description = ""
    type = string
    default = "@#$kxdyOGB78#@"
}

#NIC Variables
variable "vm_nic01_name" {
    description = "Nic Name"
    type = string   #Specify the variable data type
    default = "vm-nic-dev-cpg03-01"
}


variable "vm_nic01_ip_conf_name" {
    description = "Specify the variable descripton"
    type = string   #Specify the variable data type
    default = "vm-nic-ip-config-dev-cpg03-01"
}
