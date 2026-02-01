locals {
  application_containers = {
    gitlab = {
      vmid           = 104
      target_node    = "proxade"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      # Profile Large but customized
      rootfs_size    = "40G"
      memory         = 6144
      
      network = {
        ip = "192.168.1.104/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.app
    }

    caddy = {
      vmid           = 105
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      rootfs_size    = local.profiles.small.rootfs_size
      
      network = {
        bridge  = "VLAN40"
        ip      = "192.168.40.105/24"
        gateway = local.network.gateway_vlan40
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.app, ["proxy"])
    }

    authentik = {
      vmid           = 107
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      rootfs_size    = "24G"
      
      network = {
        bridge  = "VLAN40"
        ip      = "192.168.40.107/24"
        gateway = local.network.gateway_vlan40
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.app, ["auth"])
    }

    gotify = {
      vmid           = 109
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      network = {
        bridge  = "VLAN20"
        ip      = "192.168.20.109/24"
        gateway = local.network.gateway_vlan20
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.app
    }

    gitea = {
      vmid           = 112
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_docker
      rootfs_storage = "local-lvm"
      rootfs_size    = local.profiles.small.rootfs_size
      
      network = {
        bridge  = "VLAN40"
        ip      = "192.168.40.112/24"
        gateway = local.network.gateway_vlan40
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.app, ["git"])
    }

    vaultwarden = {
      vmid           = 113
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      network = {
        bridge  = "VLAN30"
        ip      = "192.168.30.113/24"
        gateway = local.network.gateway_vlan30
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.app, ["security"])
    }

    gatus = {
      vmid           = 120
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      network = {
        bridge  = "VLAN20"
        ip      = "192.168.20.120/24"
        gateway = local.network.gateway_vlan20
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.app, ["monitoring"])
    }
    
    glance = {
      vmid           = 122
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      network = {
        ip = "192.168.1.122/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.app, ["dashboard"])
    }
  }
}
