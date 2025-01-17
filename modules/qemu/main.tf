# modules/qemu/main.tf

resource "proxmox_vm_qemu" "vm" {
  name        = var.vm_name
  vmid        = var.vm_id
  target_node = var.target_node

  # VM Base Configuration
  iso         = var.iso_file
  cores       = var.cores
  sockets     = var.sockets
  memory      = var.memory
  bios        = var.bios
  onboot      = var.start_on_boot
  oncreate    = var.start_on_create

  # Hardware Configuration
  scsihw      = "virtio-scsi-pci"
  boot        = "order=scsi0;ide2"
  agent       = var.qemu_agent

  # Network configuration
  network {
    model    = "virtio"
    bridge   = var.network_bridge
    firewall = var.network_firewall
  }

  # Disk configuration
  disk {
    type    = "scsi"
    storage = var.disk_storage
    size    = var.disk_size
    format  = var.disk_format
  }
}