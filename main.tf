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
        ip       = "192.168.1.102/24"
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

    myspeed = {
      vmid         = 104
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      ostemplate   = "local:vztmpl/nixos-image-lxc-docker-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.104/24"
      }
    }

    caddy = {
      vmid         = 105
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.105/24"
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
        ip       = "192.168.1.106/24"
      }
    } 

    authentik = {
      vmid         = 107
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      rootfs_size = "16G"
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.107/24"
      }
    } 

    linkwarden = {
      vmid         = 108
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      rootfs_size = "16G"
      ostemplate   = "local:vztmpl/nixos-image-lxc-docker-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.108/24"
      }
    } 

    gotify = {
      vmid         = 109
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      ostemplate   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.109/24"
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

  }
}
