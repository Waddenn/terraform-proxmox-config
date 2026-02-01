# outputs.tf

output "containers" {
  description = "The container resources created by this module"
  value       = proxmox_lxc.containers
}
