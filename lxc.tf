resource "proxmox_lxc" "test_container" {
  hostname     = var.lxc_hostname
  target_node  = var.target_node
  ostemplate   = var.lxc_ostemplate
  cores        = var.lxc_cores
  memory       = var.lxc_memory
  password     = var.lxc_password
  unprivileged = true

  rootfs {
    storage = var.lxc_storage
    size    = var.lxc_rootfs_size
  }

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    ip       = "dhcp"
    firewall = false
  }

  features {
    nesting = true
  }
}
