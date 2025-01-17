resource "proxmox_vm_qemu" "this" {
  # VM ID unique
  vmid        = var.qemu_vmid
  name        = var.qemu_name
  target_node = var.target_node

  # Mémoire et CPU
  memory       = var.qemu_memory
  cores        = var.qemu_cores
  sockets      = var.qemu_sockets
  cpu          = var.qemu_cpu_type

  # Sélection de la méthode d'installation
  # Exemple 1 : utilisation d'un ISO
  iso = var.qemu_iso

  # Exemple 2 : clonage d'un template existant
  # clone = var.qemu_template
  # full_clone = true
  # NOTE : si vous souhaitez cloner un template, désactivez 'iso' et activez 'clone'.
  
  # Disque
  disk {
    size              = var.qemu_disk_size
    type              = var.qemu_disk_type
    storage           = var.qemu_disk_storage
    storage_type      = var.qemu_storage_type
    format            = var.qemu_disk_format
    # On peut spécifier la position (ex: sata0, scsi0, virtio0, etc.)
    # default : "scsi0"
    # Dans l’exemple ci-dessous on suppose un contrôleur "scsi".
    position          = var.qemu_disk_position
  }

  # Réseau
  network {
    id      = 0
    model   = var.qemu_net_model
    bridge  = var.qemu_net_bridge
    vlan    = var.qemu_net_vlan
    firewall = var.qemu_net_firewall
  }

  # Cloud-Init (si vous utilisez des images cloud-init, sinon ignorer)
  # Permet de définir l'utilisateur, la clé SSH, etc.
  ciuser         = var.qemu_ssh_user
  ssh_public_keys = var.qemu_ssh_public_keys

  # Démarrage automatique
  onboot = var.qemu_onboot

  # Options supplémentaires
  # Par exemple, pour activer la KVM Hardware Virtualization
  kvm = true
}
