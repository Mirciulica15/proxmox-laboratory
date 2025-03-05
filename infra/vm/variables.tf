variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
}

variable "os_distro" {
  type        = string
  description = "Operating System Distribution"
}

variable "node_name" {
  type        = string
  description = "Proxmox node on which the Virtual Machine will be provisioned"
}

variable "vm_image" {
  type        = string
  description = "Path to the ISO image"
}

variable "datastore_id" {
  type = string
}