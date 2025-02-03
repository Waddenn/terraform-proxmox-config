
#main.tf

module "lxc_containers" {
  source = "./modules/lxc"


# Proxade

  containers = {

    ansible = {
      vmid        = 203
      target_node = "proxade"
      network = {
        ip      = "192.168.1.203/24"
      }
    }

    uptime-kuma = {
      vmid         = 204
      target_node  = "proxade"
      network = {
        ip      = "192.168.1.204/24"
      }
    }

    beszel = {
      vmid         = 205
      target_node  = "proxade"
      network = {
        ip      = "192.168.1.205/24"
      }
    }

# nuc-pve-1
  
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
      ostemplate   = "local:vztmpl/nixos-image-lxc-docker-proxmox-25.05-x86_64-linux.tar.xz"
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

    nextcloud = {
      vmid         = 105
      target_node  = "nuc-pve-1"
      rootfs_storage = "local-lvm"
      ostemplate   = "local:vztmpl/nixos-image-lxc-docker-proxmox-25.05-x86_64-linux.tar.xz"
      rootfs_size = "120G"
      network = {
        ip       = "192.168.1.105/24"
      }
    }
  }
}
