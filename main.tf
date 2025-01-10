# main.tf

module "lxc_a" {
  source = "./modules/lxc"

  lxc_hostname      = "test-lxc-a"
  target_node       = "proxade"
  lxc_cores         = 1
  lxc_memory        = 512
  lxc_password      = var.lxc_password_a
  unprivileged      = true
  lxc_rootfs_size   = "8G"
  network_ip        = "dhcp"
  features_nesting  = true
}

module "lxc_b" {
  source = "./modules/lxc"

  lxc_hostname      = "test-lxc-b"
  target_node       = "proxade"
  lxc_cores         = 2
  lxc_memory        = 1024
  lxc_password      = var.lxc_password_b
  unprivileged      = true
  lxc_rootfs_size   = "16G"
  network_ip        = "dhcp"
  features_nesting  = true
}

