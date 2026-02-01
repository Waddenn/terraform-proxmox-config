locals {
  media_containers = {
    calibre = {
      vmid           = 110
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      rootfs_size    = local.profiles.small.rootfs_size
      
      network = {
        bridge  = "VLAN20"
        ip      = "192.168.20.110/24"
        gateway = local.network.gateway_vlan20
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.media
    }

    paperless = {
      vmid           = 114
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      rootfs_size    = "32G" # Profile Medium
      
      network = {
        bridge  = "VLAN40"
        ip      = "192.168.40.114/24"
        gateway = local.network.gateway_vlan40
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.media
    }

    immich = {
      vmid           = 115
      target_node    = "proxade"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "Storage"
      rootfs_size    = "500G"
      cores          = 4
      memory         = 6144
      
      network = {
        ip = "192.168.40.115/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.media
    }

    jellyseerr = {
      vmid           = 121
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      # Custom Profile
      cores          = 6
      memory         = 6144
      rootfs_size    = "24G"
      
      network = {
        bridge  = "VLAN40"
        ip      = "192.168.40.121/24"
        gateway = local.network.gateway_vlan40
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.media
    }
  }
}
