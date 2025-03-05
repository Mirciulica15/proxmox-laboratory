terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.73.0"
    }
  }
}

provider "proxmox" {
  endpoint = "https://10.15.12.11:8006/"

  insecure = true

  ssh {
    agent = true
  }
}
