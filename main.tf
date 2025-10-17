#main.tf

module "lxc_containers" {
  source = "./modules/lxc"

  containers = {

# nuc-pve-1
  
    ansible = {
      vmid         = 252
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      rootfs_size = "16G" 
      ostemplate   = "local:vztmpl/nixos-image-lxc-docker-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.252/24"
      }
    } 

    tailscale-subnet = {
      vmid         = 100
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      rootfs_size = "16G" 
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.100/24"
      }
    }

    tailscale-exit-node = {
      vmid         = 101
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      rootfs_size = "18G" 
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.101/24"
      }
    }

    beszel = {
      vmid         = 102
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      ostemplate   = "local:vztmpl/nixos-image-lxc-docker-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        bridge   = "VLAN20"         
        ip       = "192.168.20.102/24"
        gateway  = "192.168.20.254"
      }
    }

    adguardhome = {
      vmid         = 103
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.103/24"
      }
    }

    gitlab = {
      vmid         = 104
      target_node  = "proxade"
      rootfs_storage = "local-lvm"
      rootfs_size = "32G"
      memory = 6144
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.104/24"
      }
    }

    caddy = {
      vmid         = 105
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      rootfs_size = "16G"
      network = {
        bridge   = "VLAN40"
        ip       = "192.168.40.105/24"
        gateway  = "192.168.40.254"
      }
    }

    authentik = {
      vmid         = 107
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      rootfs_size = "16G"
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        bridge   = "VLAN40"
        ip       = "192.168.40.107/24"
        gateway  = "192.168.40.254"
      }
    } 

    linkwarden = {
      vmid         = 108
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      rootfs_size = "16G"
      ostemplate   = "local:vztmpl/nixos-image-lxc-docker-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        bridge   = "VLAN40"
        ip       = "192.168.40.108/24"
        gateway  = "192.168.40.254"
      }
    } 

    gotify = {
      vmid         = 109
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        bridge   = "VLAN20"
        ip       = "192.168.20.109/24"
        gateway  = "192.168.20.254"
      }
    } 

    calibre = {
      vmid         = 110
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      rootfs_size = "16G"
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        bridge   = "VLAN20"
        ip       = "192.168.20.110/24"
        gateway  = "192.168.20.254"
      }
    } 

    gitea = {
      vmid         = 112
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      rootfs_size = "16G"
      ostemplate   = "local:vztmpl/nixos-image-lxc-docker-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
           bridge   = "VLAN40"
           ip       = "192.168.40.112/24"
            gateway  = "192.168.40.254"
      }
    }

    vaultwarden = {
      vmid         = 113
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
           bridge   = "VLAN30"
           ip       = "192.168.30.113/24"
            gateway  = "192.168.30.254"
      }
    }
    
    paperless = {
      vmid         = 114
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      rootfs_size = "16G"
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
           bridge   = "VLAN40"
           ip       = "192.168.40.114/24"
           gateway  = "192.168.40.254"
    }
  }

    immich = {
      vmid         = 115
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      cores = 4
      rootfs_size = "32G"
      memory = 6144
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
          ip       = "192.168.1.115/24"
      }
    }

    nextcloud-pgsql = {
      vmid         = 116
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      rootfs_size = "32G"
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        bridge   = "VLAN40"
        ip       = "192.168.40.116/24"
        gateway  = "192.168.40.254"
      }
    } 

     onlyoffice = {
      vmid         = 118
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      rootfs_size = "32G"
      memory = 4096
      cores = 6
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        bridge   = "VLAN40"
        ip       = "192.168.40.118/24"
        gateway  = "192.168.40.254"
      }
     }

    bourse-dashboard = {
      vmid         = 119
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      rootfs_size = "16G"
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.119/24"
      }
     }
     
    gatus = {
      vmid         = 120
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        bridge   = "VLAN20"
        ip       = "192.168.20.120/24"
        gateway  = "192.168.20.254"
      }
     }

    nixos-gui = {
      vmid         = 203
      target_node  = "proxade"
      rootfs_storage = "Storage2"
      rootfs_size = "32G"
      memory = 4096
      cores = 6
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.203/24"
      }
     }
     
    jellyseerr = {
      vmid         = 121
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      cores = 6
      rootfs_size = "24G"
      memory = 6144
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        bridge   = "VLAN40"
        ip       = "192.168.40.121/24"
        gateway  = "192.168.40.254"
      }
     }

    glance = {
      vmid         = 122
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.122/24"
     }
    }
    
    github-runner = {
      vmid         = 251
      target_node  = "proxade"
      rootfs_storage = "Storage2"
      rootfs_size = "32G"
      memory = 20480
      cores = 12
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.251/24"
      }
    }

    valheim-server = {
      vmid         = 204
      target_node  = "proxade"
      rootfs_storage = "Storage2"
      rootfs_size = "32G"
      memory = 4096
      cores = 6
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.204/24"
      }
    }

}
}
