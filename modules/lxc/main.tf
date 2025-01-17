# modules/lxc/main.tf

resource "proxmox_lxc" "container" {
  vmid         = var.lxc_vmid
  hostname     = var.lxc_hostname
  ostemplate   = var.lxc_ostemplate
  target_node  = var.target_node
  cores        = var.lxc_cores
  memory       = var.lxc_memory
  password     = var.lxc_password
  unprivileged = var.unprivileged
  cmode        = var.console_mode
  ostype       = var.ostype

  rootfs {
    storage = var.lxc_storage
    size    = var.lxc_rootfs_size
  }

  network {
    name     = var.network_name
    bridge   = var.network_bridge
    ip       = "${var.network_ip}"
    gw       = "${var.network_gateway}"
    firewall = var.network_firewall
    # mtu      = 1500 
  }

  features {
    nesting = var.features_nesting
  }
  
  ssh_public_keys = var.ssh_public_key

}
