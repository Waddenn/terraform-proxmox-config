
#main.tf

module "lxc_containers" {
  source = "./modules/lxc"

  containers = {
    tailscale_subnet = {
      vmid         = 201
      target_node  = "proxade"
      network = {
        ip       = "192.168.1.201/24"
        gateway  = "192.168.1.254"
      }
    }

    tailscale_exit_node = {
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

    uptime_kuma = {
      vmid         = 204
      target_node  = "proxade"
      console_mode = "console"
      ostype       = "nixos"
      network = {
        ip      = "192.168.1.204/24"
      }
    }

    prometheus = {
      vmid         = 205
      target_node  = "proxade"
      console_mode = "console"
      ostype       = "nixos"
      network = {
        ip      = "192.168.1.205/24"
      }
    }

    grafana = {
      vmid         = 206
      target_node  = "proxade"
      console_mode = "console"
      ostype       = "nixos"
      network = {
        ip      = "192.168.1.206/24"
      }
    }
  }
}
