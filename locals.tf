locals {
  # Resource Profiles
  profiles = {
    small = {
      cores       = 2
      memory      = 2048
      rootfs_size = "16G"
    }
    medium = {
      cores       = 4
      memory      = 4096
      rootfs_size = "32G"
    }
    large = {
      cores       = 6
      memory      = 6144
      rootfs_size = "40G"
    }
    xl = {
      cores       = 12
      memory      = 20480
      rootfs_size = "100G"
    }
  }

  # Standard Tags
  tags = {
    infrastructure = ["infrastructure", "core"]
    app            = ["application", "web"]
    media          = ["media", "entertainment"]
    dev            = ["development", "testing"]
    db             = ["database", "backend"]
  }

  # Network / VLAN Configuration
  # Mapped from Proxmox configuration:
  # - VLAN20  -> vPROD  (Internal Production)
  # - VLAN30  -> vSEC   (Secure / Sensitive)
  # - VLAN40  -> vDMZ   (Exposed Services)
  # - VLAN100 -> projet (Projects / Lab)
  # - vmbr0   -> LAN    (Management)
  vlans = {
    mgmt = {
      bridge  = "vmbr0"
      gateway = "192.168.1.1"
      cidr    = "192.168.1.0/24"
    }
    prod = {
      bridge  = "VLAN20" # vPROD
      gateway = "192.168.20.254"
      cidr    = "192.168.20.0/24"
    }
    sec = {
      bridge  = "VLAN30" # vSEC
      gateway = "192.168.30.254"
      cidr    = "192.168.30.0/24"
    }
    dmz = {
      bridge  = "VLAN40" # vDMZ
      gateway = "192.168.40.254"
      cidr    = "192.168.40.0/24"
    }
    project = {
      bridge  = "VLAN100" # projet
      gateway = "192.168.100.254" # Assumed gateway structure
      cidr    = "192.168.100.0/24"
    }
  }

  # Templates - Centralized definition
  templates = {
    nixos_base   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
    nixos_docker = "local:vztmpl/nixos-image-lxc-docker-proxmox-25.05-x86_64-linux.tar.xz"
  }
}
