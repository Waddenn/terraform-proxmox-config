
#main.tf

module "lxc_containers" {
  source = "./modules/lxc"


# Proxade

  containers = {

    tailscale-exit-node = {
      vmid        = 202
      target_node = "proxade"
      network = {
        ip      = "192.168.1.202/24"
      }
    }

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
      storage = "local-lvm"
      ostemplate   = "nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
      network = {
        ip       = "192.168.1.100/24"
      }
    }

  }
}
