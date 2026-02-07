locals {
  application_containers = {

    caddy = {
      vmid           = 105
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      # Profile: Small
      cores          = local.profiles.small.cores
      memory         = local.profiles.small.memory
      rootfs_size    = local.profiles.small.rootfs_size
      
      network = {
        bridge  = local.vlans.dmz.bridge # vDMZ
        ip      = "192.168.40.105/24"
        gateway = local.vlans.dmz.gateway
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.app, ["proxy"])
    }

    gotify = {
      vmid           = 109
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      # Profile: Small
      cores          = local.profiles.small.cores
      memory         = local.profiles.small.memory
      rootfs_size    = local.profiles.small.rootfs_size
      
      network = {
        bridge  = local.vlans.prod.bridge # vPROD
        ip      = "192.168.20.109/24"
        gateway = local.vlans.prod.gateway
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.app
    }

    vaultwarden = {
      vmid           = 113
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      # Profile: Small
      cores          = local.profiles.small.cores
      memory         = local.profiles.small.memory
      rootfs_size    = local.profiles.small.rootfs_size
      
      network = {
        bridge  = local.vlans.sec.bridge # vSEC
        ip      = "192.168.30.113/24"
        gateway = local.vlans.sec.gateway
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.app, ["security"])
    }

    gatus = {
      vmid           = 120
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      # Profile: Small
      cores          = local.profiles.small.cores
      memory         = local.profiles.small.memory
      rootfs_size    = local.profiles.small.rootfs_size
      
      network = {
        bridge  = local.vlans.prod.bridge # vPROD
        ip      = "192.168.20.120/24"
        gateway = local.vlans.prod.gateway
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.app, ["monitoring"])
    }
    

    nextcloud-pgsql = {
      vmid           = 116
      target_node    = "proxade"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "Storage2"
      
      # Managed: 3 cores, 2048MB, 50G
      cores          = 3
      memory         = 2048
      rootfs_size    = "50G"
      
      network = {
        bridge  = local.vlans.dmz.bridge
        ip      = "192.168.40.116/24"
        gateway = local.vlans.dmz.gateway
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.app, ["db"])
    }
  }
}
