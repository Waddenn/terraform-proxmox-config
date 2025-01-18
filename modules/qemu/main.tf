# modules/qemu/main.tf

resource "proxmox_vm_qemu" "vm" {
  name        = var.vm_name
  vmid        = var.vm_id
  target_node = var.target_node

  cores       = var.cores
  sockets     = var.sockets
  memory      = var.memory
  bios        = var.bios
  onboot      = var.start_on_boot

  network {
    model    = "virtio"
    bridge   = var.network_bridge
    firewall = var.network_firewall
    id       = 0
  }

  disk {
    storage = var.disk_storage
    size    = var.disk_size
    emulatessd = var.emulatessd
    slot    = "scsi0"
       
  }
   clone_id = 1002
   full_clone = true
}