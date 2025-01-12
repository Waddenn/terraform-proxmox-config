# modules/lxc/main.tf

resource "proxmox_lxc" "container" {
  vmid         = var.lxc_vmid
  hostname     = var.lxc_hostname
  clone        = var.lxc_clone != null ? var.lxc_clone : null
  ostemplate   = var.lxc_clone == null ? var.lxc_ostemplate : null
  target_node  = var.target_node
  cores        = var.lxc_cores
  memory       = var.lxc_memory
  password     = var.lxc_password
  unprivileged = var.unprivileged

  rootfs {
    storage = var.lxc_storage
    size    = var.lxc_clone == null ? var.lxc_rootfs_size : null
  }

  network {
    name     = var.network_name
    bridge   = var.network_bridge
    ip       = "${var.network_ip}"
    gw       = "${var.network_gateway}"
    firewall = var.network_firewall
  }

  features {
    nesting = var.features_nesting
  }
  
  ssh_public_keys = var.ssh_public_key

}
