terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.0"
    }
  }
}

provider "proxmox" {
  pm_api_url           = "https://192.168.1.1:8006/api2/json"
  pm_api_token_id      = "terraform-prov@pve!terraform"
  pm_api_token_secret  = var.api_token
  pm_tls_insecure      = true 
}

resource "proxmox_lxc" "test_container" {
  hostname      = "test-lxc"
  target_node   = "proxade" 
  ostemplate    = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  cores         = 1
  memory        = 512
  password      = "rootpassword"
  unprivileged = true
  rootfs {
    storage = "Storage2"
    size    = "8G"
  }

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    ip       = "dhcp"
    firewall = false
  }

  features {
    nesting = true
  }
}
