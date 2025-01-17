resource "proxmox_lxc" "containers" {
  # On boucle sur la map "containers" pour créer un conteneur par clé
  for_each = var.containers

  vmid         = each.value.vmid
  hostname     = each.value.hostname
  ostemplate   = each.value.ostemplate
  target_node  = each.value.target_node

  cores        = each.value.cores
  memory       = each.value.memory
  password     = each.value.password
  unprivileged = each.value.unprivileged
  cmode        = each.value.console_mode
  ostype       = each.value.ostype

  # RootFS
  rootfs {
    storage = each.value.rootfs_storage
    size    = each.value.rootfs_size
  }

  # Réseau
  network {
    name     = each.value.network.name
    bridge   = each.value.network.bridge
    ip       = each.value.network.ip
    gw       = each.value.network.gateway
    firewall = each.value.network.firewall
  }

  # Features
  features {
    nesting = each.value.features.nesting
  }

  # Clés SSH
  ssh_public_keys = each.value.ssh_public_keys
}
