resource "proxmox_vm_qemu" "this" {
  vmid        = var.qemu_vmid
  name        = var.qemu_name
  target_node = var.target_node

  # Mémoire et CPU
  memory      = var.qemu_memory
  cores       = var.qemu_cores
  sockets     = var.qemu_sockets
  cpu         = var.qemu_cpu_type

  # ISO OU Clone
  iso    = var.qemu_iso
  # clone  = var.qemu_template
  # full_clone = true

  # Disque
  disk {
    size         = var.qemu_disk_size
    type         = var.qemu_disk_type
    storage      = var.qemu_disk_storage
    storage_type = var.qemu_storage_type
    format       = var.qemu_disk_format
    slot         = var.qemu_disk_position
  }

  # Réseau
  network {
    model    = var.qemu_net_model
    bridge   = var.qemu_net_bridge
    tag      = var.qemu_net_vlan
    firewall = var.qemu_net_firewall
  }

  # Cloud-init
  ciuser  = var.qemu_ssh_user
  sshkeys = var.qemu_ssh_public_keys

  # Démarrage auto
  onboot = var.qemu_onboot

  # Activer KVM
  kvm = true
}
