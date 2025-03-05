resource "proxmox_virtual_environment_vm" "vm" {
  name        = var.vm_name
  description = "Managed by Terraform"
  tags        = ["terraform", var.os_distro]

  node_name = var.node_name

  agent {
    enabled = false
  }
  stop_on_destroy = true

  startup {
    order      = "3"
    up_delay   = "60"
    down_delay = "60"
  }

  cpu {
    cores = 2
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 2048
    floating  = 2048
  }

  disk {
    datastore_id = var.datastore_id
    file_id      = "local:iso/${var.vm_image}"
    interface    = "scsi0"
  }

  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      keys     = [trimspace(tls_private_key.vm_key.public_key_openssh)]
      password = random_password.vm_password.result
      username = "user"
    }

    datastore_id = var.datastore_id
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }

  tpm_state {
    version      = "v2.0"
    datastore_id = var.datastore_id
  }

  serial_device {}
}

resource "random_password" "vm_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "tls_private_key" "vm_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

output "vm_password" {
  value     = random_password.vm_password.result
  sensitive = true
}

output "vm_private_key" {
  value     = tls_private_key.vm_key.private_key_pem
  sensitive = true
}

output "vm_public_key" {
  value = tls_private_key.vm_key.public_key_openssh
}