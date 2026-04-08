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