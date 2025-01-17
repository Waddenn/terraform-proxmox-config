# modules/qemu/main.tf

resource "proxmox_vm_qemu" "vm" {
  name        = var.vm_name
  vmid        = var.vm_id
  target_node = var.target_node

  # VM Base Configuration
  cores       = var.cores
  sockets     = var.sockets
  memory      = var.memory
  bios        = var.bios
  onboot      = var.start_on_boot

  # Network configuration
  network {
    model    = "virtio"
    bridge   = var.network_bridge
    firewall = var.network_firewall
    tag      = 0
    id      = 0
  }
  # Disk configuration
  disk {
    storage = var.disk_storage
    size    = var.disk_size
    format  = var.disk_format
       
  }
   clone = 1002
   full_clone = true
}