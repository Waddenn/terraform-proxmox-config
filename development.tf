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
        bridge  = local.vlans.dmz.bridge
        ip      = "192.168.40.118/24"
        gateway = local.vlans.dmz.gateway
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.app, ["office"])
    }

    authelia = {
      vmid           = 123
      target_node    = "nuc-pve-1"
      ostemplate     = local.templates.nixos_base
      rootfs_storage = "local-lvm"
      
      cores          = 2
      memory         = local.profiles.medium.memory
      rootfs_size    = local.profiles.medium.rootfs_size
      
      network = {
        bridge  = local.vlans.dmz.bridge 
        ip      = "192.168.40.123/24"
        gateway = local.vlans.dmz.gateway
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.app, ["auth"])
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
      
      # Profile: Medium (XL was overkill for 2.3G usage)
      cores          = local.profiles.medium.cores
      memory         = local.profiles.medium.memory
      rootfs_size    = local.profiles.medium.rootfs_size
      
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
      
      # Managed: 8 cores, 18144MB RAM, 32G Disk (Increased from 20G)
      cores          = 8
      memory         = 18144
      rootfs_size    = "32G"
      
      network = {
        bridge = local.vlans.mgmt.bridge
        ip     = "dhcp"
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.app, ["game"])
    }

    ai-controller = {
      vmid           = 252
      target_node    = "proxade"
      ostemplate     = local.templates.nixos_docker
      rootfs_storage = "Storage2"
      
      # Profile: XL (AI workloads: gemini-cli, codex-cli, Docker containers)
      cores          = local.profiles.xl.cores
      memory         = local.profiles.xl.memory
      rootfs_size    = local.profiles.xl.rootfs_size
      
      network = {
        bridge  = local.vlans.mgmt.bridge
        ip      = "192.168.1.252/24"
        gateway = local.vlans.mgmt.gateway
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.dev, ["ai", "docker"])
    }

    dev-debian = {
      vmid           = 124
      target_node    = "proxade"
      ostemplate     = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
      ostype         = "debian"
      rootfs_storage = "Storage2"
      
      # Profile: XL (Local dev debian)
      cores          = local.profiles.xl.cores
      memory         = local.profiles.xl.memory
      rootfs_size    = local.profiles.xl.rootfs_size
      
      network = {
        bridge  = local.vlans.mgmt.bridge
        ip      = "192.168.1.124/24"
        gateway = local.vlans.mgmt.gateway
      }
      ssh_public_keys = var.ssh_public_key
      tags            = concat(local.tags.dev, ["debian", "debian-13"])
    }
  }
}
