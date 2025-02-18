#main.tf

module "lxc_containers" {
  source = "./modules/lxc"

  containers = {

    grafana = {
      vmid         = 202
      target_node  = "proxade"
      rootfs_storage = "Storage2"
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.202/24"
    }
  }

    prometheus = {
      vmid         = 203
      target_node  = "proxade"
      rootfs_storage = "Storage2"
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.203/24"
      }
    }

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
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.100/24"
      }
    }

    tailscale-exit-node = {
      vmid         = 101
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
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
        bridge   = "VLAN20"
        ip       = "192.168.20.103/24"
        gateway  = "192.168.20.254"
      }
    }

    myspeed = {
      vmid         = 104
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      ostemplate   = "local:vztmpl/nixos-image-lxc-docker-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        bridge   = "VLAN20"
        ip       = "192.168.1.104/24"
        gateway  = "192.168.20.254"
      }
    }

    caddy = {
      vmid         = 105
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        bridge   = "VLAN20"
        ip       = "192.168.20.105/24"
        gateway  = "192.168.20.254"
      }
    }

    nextcloud = {
      vmid         = 106
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      rootfs_size = "120G"
      memory = 2048
      cores = 6
      ostemplate   = "local:vztmpl/nixos-image-lxc-docker-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        bridge   = "VLAN20"
        ip       = "192.168.20.106/24"
        gateway  = "192.168.20.254"
      }
    } 

    authentik = {
      vmid         = 107
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      rootfs_size = "16G"
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        bridge   = "VLAN20"
        ip       = "192.168.20.107/24"
        gateway  = "192.168.20.254"
      }
    } 

    linkwarden = {
      vmid         = 108
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      rootfs_size = "16G"
      ostemplate   = "local:vztmpl/nixos-image-lxc-docker-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        bridge   = "VLAN20"
        ip       = "192.168.20.108/24"
        gateway  = "192.168.20.254"
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
           ip       = "192.168.1.112"
      }
    }
  }
}
