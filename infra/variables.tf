variable "talos_nodes" {
  type    = set(string)
  default = ["master-1", "worker-1"]
}