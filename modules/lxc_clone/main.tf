resource "proxmox_lxc" "clone" {
  vmid         = var.lxc_vmid
  hostname     = var.lxc_hostname
  target_node  = var.target_node
  clone        = var.template_id
}

resource "proxmox_lxc" "config" {
  vmid         = proxmox_lxc.clone.vmid
  hostname     = proxmox_lxc.clone.hostname
  target_node  = proxmox_lxc.clone.target_node
  cores        = var.lxc_cores
  memory       = var.lxc_memory
  password     = var.lxc_password
  unprivileged = var.unprivileged

  rootfs {
    storage = var.lxc_storage
    size    = var.lxc_rootfs_size
  }

  network {
    name     = var.network_name
    bridge   = var.network_bridge
    ip       = var.network_ip
    gw       = var.network_gateway
    firewall = var.network_firewall
  }

  ssh_public_keys = var.ssh_public_key

  depends_on = [proxmox_lxc.clone]
}
