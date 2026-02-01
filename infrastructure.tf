locals {
  infrastructure_containers = {
    ansible = {
      vmid           = 252
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_docker
      rootfs_storage = "local-lvm"
      
      # Profile: Small
      cores          = local.profiles.small.cores
      memory         = local.profiles.small.memory
      rootfs_size    = local.profiles.small.rootfs_size
      
      network = {
        # Management Network (LAN)
        bridge = local.vlans.mgmt.bridge
        ip     = "192.168.1.252/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.infrastructure
    }

    terraform = {
      vmid           = 253
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      # Managed: 8 cores, 3040MB RAM, 17G Disk
      cores          = 8
      memory         = 3040
      rootfs_size    = "17G"
      
      network = {
        bridge = local.vlans.mgmt.bridge
        ip     = "192.168.1.253/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.infrastructure
    }




    tailscale-subnet = {
      vmid           = 100
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      # Profile: Small
      cores          = local.profiles.small.cores
      memory         = local.profiles.small.memory
      rootfs_size    = local.profiles.small.rootfs_size
      
      network = {
        bridge = local.vlans.mgmt.bridge
        ip     = "192.168.1.100/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.infrastructure
    }

    tailscale-exit-node = {
      vmid           = 101
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      # Profile: Small (with custom disk)
      cores          = local.profiles.small.cores
      memory         = local.profiles.small.memory
      rootfs_size    = "18G"
      
      network = {
        bridge = local.vlans.mgmt.bridge
        ip     = "192.168.1.101/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.infrastructure
    }

    beszel = {
      vmid           = 102
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_docker
      rootfs_storage = "local-lvm"
      
      # Profile: Small
      cores          = local.profiles.small.cores
      memory         = local.profiles.small.memory
      rootfs_size    = local.profiles.small.rootfs_size
      
      network = {
        bridge  = local.vlans.prod.bridge # vPROD
        ip      = "192.168.20.102/24"
        gateway = local.vlans.prod.gateway
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.infrastructure
    }

    adguardhome = {
      vmid           = 103
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      # Profile: Small
      cores          = local.profiles.small.cores
      memory         = local.profiles.small.memory
      rootfs_size    = local.profiles.small.rootfs_size
      
      network = {
        bridge = local.vlans.mgmt.bridge
        ip     = "192.168.1.103/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.infrastructure
    }
  }
}
