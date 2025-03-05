module "talos_vm" {
  for_each     = var.talos_nodes
  source       = "./vm"
  vm_name      = "vm-talos-${each.key}"
  os_distro    = "talos"
  node_name    = "prox02"
  vm_image     = "metal-amd64.iso"
  datastore_id = "ZFS-PROX02"
}