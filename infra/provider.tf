terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.73.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-mircea-talu"
    storage_account_name = "stmirceatalu"
    container_name       = "terraform"
    key                  = "proxmox.tfstate"
  }
}

provider "proxmox" {
  endpoint = "https://10.15.12.11:8006/"

  insecure = true

  ssh {
    agent = true
  }
}