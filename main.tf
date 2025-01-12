# main.tf

module "tailscale-subnet" {
  source = "./modules/lxc"

  lxc_hostname      = "tailscale-subnet"
  target_node       = "proxade"
  lxc_cores         = 1
  lxc_memory        = 128
  lxc_password      = var.lxc_password_a
  unprivileged      = true
  lxc_rootfs_size   = "4G"
  network_ip        = "192.168.1.201"
  network_gateway = "192.168.1.254"
  features_nesting  = true
  ssh_public_key    = file("~/.ssh/id_rsa.pub")
}

module "tailscale-exit-node" {
  source = "./modules/lxc"

  lxc_hostname      = "test-lxc-b"
  target_node       = "proxade"
  lxc_cores         = 1
  lxc_memory        = 128
  lxc_password      = var.lxc_password_b
  unprivileged      = true
  lxc_rootfs_size   = "4G"
  network_ip        = "192.168.1.202"
  network_gateway = "192.168.1.254"
  features_nesting  = true
  ssh_public_key    = file("~/.ssh/id_rsa.pub")
}

