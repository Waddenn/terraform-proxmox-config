locals {
  media_containers = {
    calibre = {
      vmid           = 110
      target_node    = "proxade"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "Storage2"
      
      # Profile: Small
      cores          = local.profiles.small.cores
      memory         = local.profiles.small.memory
      rootfs_size    = local.profiles.small.rootfs_size
      
      network = {
        bridge  = local.vlans.prod.bridge # vPROD
        ip      = "192.168.20.110/24"
        gateway = local.vlans.prod.gateway
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.media
    }

    paperless = {
      vmid           = 114
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      # Profile: Medium
      cores          = local.profiles.medium.cores
      memory         = local.profiles.medium.memory
      rootfs_size    = local.profiles.medium.rootfs_size
      
      network = {
        bridge  = local.vlans.dmz.bridge # vDMZ
        ip      = "192.168.40.114/24"
        gateway = local.vlans.dmz.gateway
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.media
    }


    immich = {
      vmid           = 115
      target_node    = "proxade"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "Storage"
      
      # Profile: Large (with custom disk 500GB)
      cores          = local.profiles.large.cores
      memory         = local.profiles.large.memory
      rootfs_size    = "500G"
      
      network = {
        bridge = local.vlans.prod.bridge # vPROD
        ip     = "192.168.20.115/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.media, ["photo"])
    }

    jellyseerr = {
      vmid           = 121
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      # Profile: Large
      cores          = local.profiles.large.cores
      memory         = local.profiles.large.memory
      rootfs_size    = local.profiles.large.rootfs_size
      
      network = {
        bridge  = local.vlans.dmz.bridge # vDMZ
        ip      = "192.168.40.121/24"
        gateway = local.vlans.dmz.gateway
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.media
    }
  }
}
