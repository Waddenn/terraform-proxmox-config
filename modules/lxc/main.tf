#/modules/lxc/main.tf

resource "proxmox_lxc" "containers" {
  for_each = var.containers

  vmid         = each.value.vmid
  hostname     = each.key
  ostemplate   = each.value.ostemplate
  target_node  = each.value.target_node

  cores        = each.value.cores
  memory       = each.value.memory
  password     = each.value.password
  unprivileged = each.value.unprivileged
  cmode        = each.value.console_mode
  ostype       = each.value.ostype

  rootfs {
    storage = each.value.rootfs_storage
    size    = each.value.rootfs_size
  }

  network {
    name     = each.value.network.name
    bridge   = each.value.network.bridge
    ip       = each.value.network.ip
    gw       = each.value.network.gateway
    firewall = each.value.network.firewall
  }

  features {
    nesting = each.value.features.nesting
  }

  ssh_public_keys = each.value.ssh_public_keys
}
