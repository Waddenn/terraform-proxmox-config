locals {
  infrastructure_containers = {
    ansible = {
      vmid           = 252
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_docker
      rootfs_storage = "local-lvm"
      rootfs_size    = local.profiles.small.rootfs_size
      
      network = {
        ip = "192.168.1.252/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.infrastructure
    }

    tailscale-subnet = {
      vmid           = 100
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      rootfs_size    = local.profiles.small.rootfs_size
      
      network = {
        ip = "192.168.1.100/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.infrastructure
    }

    tailscale-exit-node = {
      vmid           = 101
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      rootfs_size    = "18G" # Custom size
      
      network = {
        ip = "192.168.1.101/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.infrastructure
    }

    beszel = {
      vmid           = 102
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_docker
      rootfs_storage = "local-lvm"
      rootfs_size    = local.profiles.small.rootfs_size
      
      network = {
        bridge  = "VLAN20"
        ip      = "192.168.20.102/24"
        gateway = local.network.gateway_vlan20
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.infrastructure
    }

    adguardhome = {
      vmid           = 103
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      network = {
        ip = "192.168.1.103/24"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = local.tags.infrastructure
    }
  }
}
