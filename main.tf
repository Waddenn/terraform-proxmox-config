module "lxc_containers" {
  source = "./modules/lxc"

  containers = {
    # Exemple : Tailscale-subnet
    tailscale_subnet = {
      vmid         = 201
      hostname     = "tailscale-subnet"
      target_node  = "proxade"
      ostemplate   = "local:vztmpl/nixos-image-lxc-proxmox-25.05beta-x86_64-linux.tar.xz"
      password     = null
      network = {
        ip       = "192.168.1.201/24"
        gateway  = "192.168.1.254"
      }
    }

    # Exemple : Tailscale-exit-node
    tailscale_exit_node = {
      vmid        = 202
      hostname    = "tailscale-exit-node"
      target_node = "proxade"
      ostemplate  = "local:vztmpl/nixos-image-lxc-proxmox-25.05beta-x86_64-linux.tar.xz"
      network = {
        ip      = "192.168.1.202/24"
        gateway = "192.168.1.254"
      }
    }

    # Exemple : Ansible
    ansible = {
      vmid        = 203
      hostname    = "ansible"
      target_node = "proxade"
      ostemplate  = "local:vztmpl/nixos-image-lxc-proxmox-25.05beta-x86_64-linux.tar.xz"
      network = {
        ip      = "192.168.1.203/24"
        gateway = "192.168.1.254"
      }
    }

    # Exemple : Uptime-kuma
    uptime_kuma = {
      vmid         = 204
      hostname     = "uptime-kuma"
      target_node  = "proxade"
      ostemplate   = "local:vztmpl/nixos-image-lxc-proxmox-25.05beta-x86_64-linux.tar.xz"
      console_mode = "console"
      ostype       = "nixos"
      network = {
        ip      = "192.168.1.204/24"
        gateway = "192.168.1.254"
      }
    }

    # Exemple : Prometheus
    prometheus = {
      vmid         = 205
      hostname     = "prometheus"
      target_node  = "proxade"
      ostemplate   = "local:vztmpl/nixos-image-lxc-proxmox-25.05beta-x86_64-linux.tar.xz"
      console_mode = "console"
      ostype       = "nixos"
      network = {
        ip      = "192.168.1.205/24"
        gateway = "192.168.1.254"
      }
    }

    # Exemple : Grafana
    grafana = {
      vmid         = 206
      hostname     = "grafana"
      target_node  = "proxade"
      ostemplate   = "local:vztmpl/nixos-image-lxc-proxmox-25.05beta-x86_64-linux.tar.xz"
      console_mode = "console"
      ostype       = "nixos"
      network = {
        ip      = "192.168.1.206/24"
        gateway = "192.168.1.254"
      }
    }
  }
}
