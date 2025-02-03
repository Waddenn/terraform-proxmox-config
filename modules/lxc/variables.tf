#/modules/lxc/variables.tf

variable "containers" {

  type = map(object({
    vmid         = number
    hostname     = optional(string)
    target_node  = string
    ostemplate   = optional(string, "local:vztmpl/nixos-image-lxc-proxmox-25.05beta-x86_64-linux.tar.xz")

    cores        = optional(number, 3)
    memory       = optional(number, 1024)
    swap         = optional(number, 512)
    onboot       = optional(bool, true)
    password     = optional(string, null)
    unprivileged = optional(bool, true)
    console_mode = optional(string, "console")
    ostype       = optional(string, "nixos")

    rootfs_storage = optional(string, "Storage2")
    rootfs_size    = optional(string, "8G")

    network = optional(object({
      name     = optional(string, "eth0")
      bridge   = optional(string, "vmbr0")
      ip       = optional(string, "dhcp")
      gateway  = optional(string, "192.168.1.254")
      firewall = optional(bool, false)
    }), {
      name     = "eth0"
      bridge   = "vmbr0"
      ip       = "dhcp"
      gateway  = "192.168.1.254"
      firewall = false
    })

    features = optional(object({
      nesting = optional(bool, true)
    }), {
      nesting = true
    })

    ssh_public_keys = optional(string, "<<-EOT ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILDWrexcT0dL92oAYuMxLpS+2WxBzwYA38C/paRGsZ2i tom@asus-nixos EOT")
  }))

  default = {}
}
