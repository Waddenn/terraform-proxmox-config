output "clone_id" {
  value       = proxmox_lxc.clone.vmid
  description = "ID du conteneur cloné."
}

output "clone_hostname" {
  value       = proxmox_lxc.clone.hostname
  description = "Nom du conteneur cloné."
}
