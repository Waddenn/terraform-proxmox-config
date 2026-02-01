locals {
  development_containers = {
    onlyoffice = {
      vmid           = 118
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      # Profile: Medium (with custom cores)
      cores          = 6
      memory         = local.profiles.medium.memory
      rootfs_size    = local.profiles.medium.rootfs_size
      
      network = {
        bridge  = local.vlans.dmz.bridge # vDMZ
        ip      = "192.168.40.118/24"
        gateway = local.vlans.dmz.gateway
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.app, ["office"])
    }

    bourse-dashboard = {
      vmid           = 119
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      # Profile: Small
      cores          = local.profiles.small.cores
      memory         = local.profiles.small.memory
      rootfs_size    = local.profiles.small.rootfs_size
      
      network = {
        bridge = local.vlans.mgmt.bridge
        ip     = "192.168.1.119/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.dev
    }

    github-runner = {
      vmid           = 251
      target_node    = "proxade"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "Storage2"
      
      # Profile: XL
      cores          = local.profiles.xl.cores
      memory         = local.profiles.xl.memory
      rootfs_size    = local.profiles.xl.rootfs_size
      
      network = {
        bridge = local.vlans.mgmt.bridge
        ip     = "192.168.1.251/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.dev, ["ci"])
    }

    valheim-server = {
      vmid           = 204
      target_node    = "proxade"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "Storage2"
      
      # Profile: Medium (with boosted cores)
      cores          = 6
      memory         = local.profiles.medium.memory
      rootfs_size    = local.profiles.medium.rootfs_size
      
      network = {
        bridge = local.vlans.mgmt.bridge
        ip     = "192.168.1.204/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.app, ["game"])
    }

    dev-nixos = {
      vmid           = 205
      target_node    = "proxade"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "Storage2"
      
      # Profile: Medium (with boosted cores)
      cores          = 6
      memory         = local.profiles.medium.memory
      rootfs_size    = local.profiles.medium.rootfs_size
      
      network = {
        bridge = local.vlans.mgmt.bridge
        ip     = "192.168.1.205/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.dev
    }

    hytale-server = {
      vmid           = 206
      target_node    = "proxade"
      ostemplate     = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
      ostype         = "debian"
      rootfs_storage = "local-lvm"
      
      # Managed: 8 cores, 18144MB RAM, 20G Disk
      cores          = 8
      memory         = 18144
      rootfs_size    = "20G"
      
      network = {
        bridge = local.vlans.mgmt.bridge
        ip     = "dhcp"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.app, ["game"])
    }
  }
}
