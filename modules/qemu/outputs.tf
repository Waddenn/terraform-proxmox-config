output "qemu_vm_id" {
  description = "VMID de la VM QEMU créée."
  value       = proxmox_vm_qemu.this.vmid
}

output "qemu_vm_name" {
  description = "Nom de la VM QEMU créée."
  value       = proxmox_vm_qemu.this.name
}
