# main.tf

module "tailscale-subnet" {
  source = "./modules/lxc"

  lxc_vmid         = 201
  lxc_hostname      = "tailscale-subnet"
  target_node       = "proxade"
  lxc_cores         = 1
  lxc_memory        = 128
  lxc_password      = var.lxc_password_a
  unprivileged      = true
  lxc_rootfs_size   = "4G"
  network_ip        = "192.168.1.201/24"
  network_gateway = "192.168.1.254"
  features_nesting  = true
  lxc_clone        = null                 
  lxc_ostemplate   = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
  ssh_public_key    = <<-EOT
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCKjyasY2YEtzqecWUQY2/AeTb7LEauFDDatzByT1P0WvQKVdpyZ///i8Y6qv9OuMhgrDvvHZK3mne7l/ecaYuc3gvsgFDpu2FXAFMWmRnb/+xW41qxHKI927KcGr0xGCWKO03cgxzq5k0gUmqHbQR1Q9aT4KiEJ9qc4K11zW2FI543IlpfPIUYSeXXOC0cj2MaQwhQpU3AOEblPOvkWz80OyW3lvRPADgSmzrKTNkd4iDUNbRsI4jB8HWJq2W3nGjiU9WCv12SU94tQRt015oxqae6Kww3gTnoUjeY6unOjZiXN7NCVmc+YFSyCKwafpl5Yk+kUSSGVb1dsuvNmYxp6j1112/yTUXl1scZqgmbHc6ODyGhMgDkuPqzW0IgulHoffn3OUuOzoyU4CIYLpZ+Qb9wE1tRbEifHTpK6it76ttA3C8QJIiWehstV3xJnM3C0Ki4DKvmllv0o55Z0jRBCqDq6sGJ51whel/GBHP4Ddfp/u2452GZ5HxjZJFdY8LqFJp3oS3RfprCJBSt1EUfILziiGj9APWKJGvmYh4qYqnxPE8pHJlh7VjcH1w3qVFGQYJ3DEGKcehATj2HEFgVknRniO0Q2uk8p4L1Em5u1VfRiVXojDKo1DL4HiFvtnF5fqWKCjCsctZtnfqRcz6br5tDlHaNU9vHhtBhwGrPpw== tom@asus-nixos
  EOT
}

module "tailscale-exit-node" {
  source = "./modules/lxc"

  lxc_vmid         = 202
  lxc_hostname      = "tailscale-exit-node"
  target_node       = "proxade"
  lxc_cores         = 1
  lxc_memory        = 128
  lxc_password      = var.lxc_password_b
  unprivileged      = true
  lxc_rootfs_size   = "4G"
  network_ip        = "192.168.1.202/24"
  network_gateway = "192.168.1.254"
  features_nesting  = true
  lxc_clone        = null                
  lxc_ostemplate   = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
  ssh_public_key    = <<-EOT
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCKjyasY2YEtzqecWUQY2/AeTb7LEauFDDatzByT1P0WvQKVdpyZ///i8Y6qv9OuMhgrDvvHZK3mne7l/ecaYuc3gvsgFDpu2FXAFMWmRnb/+xW41qxHKI927KcGr0xGCWKO03cgxzq5k0gUmqHbQR1Q9aT4KiEJ9qc4K11zW2FI543IlpfPIUYSeXXOC0cj2MaQwhQpU3AOEblPOvkWz80OyW3lvRPADgSmzrKTNkd4iDUNbRsI4jB8HWJq2W3nGjiU9WCv12SU94tQRt015oxqae6Kww3gTnoUjeY6unOjZiXN7NCVmc+YFSyCKwafpl5Yk+kUSSGVb1dsuvNmYxp6j1112/yTUXl1scZqgmbHc6ODyGhMgDkuPqzW0IgulHoffn3OUuOzoyU4CIYLpZ+Qb9wE1tRbEifHTpK6it76ttA3C8QJIiWehstV3xJnM3C0Ki4DKvmllv0o55Z0jRBCqDq6sGJ51whel/GBHP4Ddfp/u2452GZ5HxjZJFdY8LqFJp3oS3RfprCJBSt1EUfILziiGj9APWKJGvmYh4qYqnxPE8pHJlh7VjcH1w3qVFGQYJ3DEGKcehATj2HEFgVknRniO0Q2uk8p4L1Em5u1VfRiVXojDKo1DL4HiFvtnF5fqWKCjCsctZtnfqRcz6br5tDlHaNU9vHhtBhwGrPpw== tom@asus-nixos
  EOT
}

module "uptime-kuma" {
  source = "./modules/lxc"

  lxc_vmid         = 203
  lxc_hostname      = "uptime-kuma"
  target_node       = "proxade"
  lxc_cores         = 1
  lxc_memory        = 512
  lxc_password      = var.lxc_password_c
  unprivileged      = true
  lxc_rootfs_size   = "4G"
  network_ip        = "192.168.1.203/24"
  network_gateway = "192.168.1.254"
  features_nesting  = true
  lxc_clone        = "298"               
  lxc_ostemplate   = null
  ssh_public_key    = <<-EOT
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCKjyasY2YEtzqecWUQY2/AeTb7LEauFDDatzByT1P0WvQKVdpyZ///i8Y6qv9OuMhgrDvvHZK3mne7l/ecaYuc3gvsgFDpu2FXAFMWmRnb/+xW41qxHKI927KcGr0xGCWKO03cgxzq5k0gUmqHbQR1Q9aT4KiEJ9qc4K11zW2FI543IlpfPIUYSeXXOC0cj2MaQwhQpU3AOEblPOvkWz80OyW3lvRPADgSmzrKTNkd4iDUNbRsI4jB8HWJq2W3nGjiU9WCv12SU94tQRt015oxqae6Kww3gTnoUjeY6unOjZiXN7NCVmc+YFSyCKwafpl5Yk+kUSSGVb1dsuvNmYxp6j1112/yTUXl1scZqgmbHc6ODyGhMgDkuPqzW0IgulHoffn3OUuOzoyU4CIYLpZ+Qb9wE1tRbEifHTpK6it76ttA3C8QJIiWehstV3xJnM3C0Ki4DKvmllv0o55Z0jRBCqDq6sGJ51whel/GBHP4Ddfp/u2452GZ5HxjZJFdY8LqFJp3oS3RfprCJBSt1EUfILziiGj9APWKJGvmYh4qYqnxPE8pHJlh7VjcH1w3qVFGQYJ3DEGKcehATj2HEFgVknRniO0Q2uk8p4L1Em5u1VfRiVXojDKo1DL4HiFvtnF5fqWKCjCsctZtnfqRcz6br5tDlHaNU9vHhtBhwGrPpw== tom@asus-nixos
  EOT
}

module "ansible" {
  source = "./modules/lxc"

  lxc_vmid         = 204
  lxc_hostname      = "ansible"
  target_node       = "proxade"
  lxc_cores         = 1
  lxc_memory        = 512
  lxc_password      = var.lxc_password_d
  unprivileged      = true
  lxc_rootfs_size   = "4G"
  network_ip        = "192.168.1.204/24"
  network_gateway = "192.168.1.254"
  features_nesting  = true
  lxc_clone        = null                 
  lxc_ostemplate   = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
  ssh_public_key    = <<-EOT
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCKjyasY2YEtzqecWUQY2/AeTb7LEauFDDatzByT1P0WvQKVdpyZ///i8Y6qv9OuMhgrDvvHZK3mne7l/ecaYuc3gvsgFDpu2FXAFMWmRnb/+xW41qxHKI927KcGr0xGCWKO03cgxzq5k0gUmqHbQR1Q9aT4KiEJ9qc4K11zW2FI543IlpfPIUYSeXXOC0cj2MaQwhQpU3AOEblPOvkWz80OyW3lvRPADgSmzrKTNkd4iDUNbRsI4jB8HWJq2W3nGjiU9WCv12SU94tQRt015oxqae6Kww3gTnoUjeY6unOjZiXN7NCVmc+YFSyCKwafpl5Yk+kUSSGVb1dsuvNmYxp6j1112/yTUXl1scZqgmbHc6ODyGhMgDkuPqzW0IgulHoffn3OUuOzoyU4CIYLpZ+Qb9wE1tRbEifHTpK6it76ttA3C8QJIiWehstV3xJnM3C0Ki4DKvmllv0o55Z0jRBCqDq6sGJ51whel/GBHP4Ddfp/u2452GZ5HxjZJFdY8LqFJp3oS3RfprCJBSt1EUfILziiGj9APWKJGvmYh4qYqnxPE8pHJlh7VjcH1w3qVFGQYJ3DEGKcehATj2HEFgVknRniO0Q2uk8p4L1Em5u1VfRiVXojDKo1DL4HiFvtnF5fqWKCjCsctZtnfqRcz6br5tDlHaNU9vHhtBhwGrPpw== tom@asus-nixos
  EOT
}
