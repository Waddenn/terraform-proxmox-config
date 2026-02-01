#/modules/lxc/main.tf

resource "proxmox_lxc" "containers" {
  for_each = var.containers

  vmid         = each.value.vmid
  hostname = coalesce(each.value.hostname, each.key)
  ostemplate   = each.value.ostemplate
  target_node  = each.value.target_node

  cores        = each.value.cores
  memory       = each.value.memory
  swap         = each.value.swap
  onboot       = each.value.onboot
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
  tags            = join(";", each.value.tags)

  lifecycle {
    ignore_changes = [
      ssh_public_keys,
      ostemplate,
      ostype,
      rootfs,
      features,
      target_node,
      cores,
      memory,
      swap
    ]
  }
}

resource "null_resource" "tailscale_tun_permission" {
  for_each = var.containers

  triggers = {
    vmid        = each.value.vmid
    target_node = each.value.target_node
  }

  # Using local-exec to wrap ssh might be more robust if key paths are unknown/variable.
  # REVISION: Using 'local-exec' with the exact ssh command we verified works manually.
  
  provisioner "local-exec" {
    command = <<EOT
      TARGET_IP="${each.value.target_node == "proxade" ? "192.168.1.1" : (each.value.target_node == "nuc-pve-1" ? "192.168.1.3" : each.value.target_node)}"
      ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no -o ConnectTimeout=30 -o BatchMode=yes root@$TARGET_IP "
        CONF_FILE='/etc/pve/lxc/${each.value.vmid}.conf'
        if ! grep -q 'lxc.cgroup2.devices.allow: c 10:200 rwm' \$CONF_FILE; then
          echo 'lxc.cgroup2.devices.allow: c 10:200 rwm' >> \$CONF_FILE
          echo 'Adding TUN permissions to \$CONF_FILE'
        fi
        if ! grep -q 'lxc.mount.entry: /dev/net/tun dev/net/tun none bind,create=file' \$CONF_FILE; then
          echo 'lxc.mount.entry: /dev/net/tun dev/net/tun none bind,create=file' >> \$CONF_FILE
          echo 'Adding TUN mount entry to \$CONF_FILE'
        fi
      "
    EOT
  }
}
