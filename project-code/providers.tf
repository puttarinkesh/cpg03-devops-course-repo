# We need to Write the Provider Information
# Either Azure or AWS or GCP or etc.,

# Also, you can specify the backend state information

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.67.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {
    
  }
}