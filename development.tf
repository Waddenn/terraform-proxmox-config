locals {
  development_containers = {
    onlyoffice = {
      vmid           = 118
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      # Custom Profile
      rootfs_size    = "32G"
      memory         = 4096
      cores          = 6
      
      network = {
        bridge  = "VLAN40"
        ip      = "192.168.40.118/24"
        gateway = local.network.gateway_vlan40
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.app, ["office"]) # Categorized as app/office
    }

    bourse-dashboard = {
      vmid           = 119
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      rootfs_size    = local.profiles.small.rootfs_size
      
      network = {
        ip = "192.168.1.119/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.dev
    }

    github-runner = {
      vmid           = 251
      target_node    = "proxade"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "Storage2"
      
      # Profile XL
      rootfs_size    = "32G"
      memory         = 20480
      cores          = 12
      
      network = {
        ip = "192.168.1.251/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.dev, ["ci"])
    }

    valheim-server = {
      vmid           = 204
      target_node    = "proxade"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "Storage2"
      
      # Profile Medium-ish
      rootfs_size    = "32G"
      memory         = 4096
      cores          = 6
      
      network = {
        ip = "192.168.1.204/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.app, ["game"])
    }

    dev-nixos = {
      vmid           = 205
      target_node    = "proxade"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "Storage2"
      
      # Profile Medium-ish
      rootfs_size    = "32G"
      memory         = 4096
      cores          = 6
      
      network = {
        ip = "192.168.1.205/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.dev
    }
  }
}
