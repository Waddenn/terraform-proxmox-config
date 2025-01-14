# modules/lxc_custom/main.tf

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
  }

  features {
    nesting = var.features_nesting
  }

  ssh_public_keys = var.ssh_public_key

  provisioner "local-exec" {
    command = <<EOT
      echo "lxc.cgroup2.devices.allow = c 10:200 rwm" >> /etc/pve/lxc/${self.vmid}.conf
      echo "lxc.mount.entry = /dev/net/tun dev/net/tun none bind,create=file" >> /etc/pve/lxc/${self.vmid}.conf
    EOT
  }
}
