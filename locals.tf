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

  # Common Network Config
  network = {
    gateway_vlan1  = "192.168.1.1" # Using standard gateway instead of arbitrary ones if possible
    gateway_vlan20 = "192.168.20.254"
    gateway_vlan30 = "192.168.30.254"
    gateway_vlan40 = "192.168.40.254"
  }

  # Templates - Centralized definition
  templates = {
    nixos_base   = "local:vztmpl/nixos-image-lxc-base-proxmox-25.05-x86_64-linux.tar.xz"
    nixos_docker = "local:vztmpl/nixos-image-lxc-docker-proxmox-25.05-x86_64-linux.tar.xz"
  }
}
