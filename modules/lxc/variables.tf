variable "containers" {
  description = <<-EOT
    Map qui décrit les conteneurs LXC à créer. 
    Chaque clé du map représente le nom logique du conteneur (ex: "prometheus") 
    et la valeur est un objet contenant les paramètres du conteneur.
  EOT

  type = map(object({
    # Paramètres obligatoires
    vmid         = number
    hostname     = string
    target_node  = string
    ostemplate   = string

    # Paramètres facultatifs + valeurs par défaut
    cores        = optional(number, 2)
    memory       = optional(number, 1024)
    password     = optional(string, null)
    unprivileged = optional(bool, true)
    console_mode = optional(string, "tty")
    ostype       = optional(string, "debian")

    # RootFS
    rootfs_storage = optional(string, "local-lvm")
    rootfs_size    = optional(string, "4G")

    # Réseau (un seul bloc network ici, mais on peut l'étendre si besoin)
    network = optional(object({
      name     = optional(string, "eth0")
      bridge   = optional(string, "vmbr0")
      ip       = optional(string, "dhcp")
      gateway  = optional(string, "192.168.1.254")
      firewall = optional(bool, false)
    }))

    # Features
    features = optional(object({
      nesting = optional(bool, false)
    }))

    # SSH Public Keys
    ssh_public_keys = optional(string, "<<-EOT ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCKjyasY2YEtzqecWUQY2/AeTb7LEauFDDatzByT1P0WvQKVdpyZ///i8Y6qv9OuMhgrDvvHZK3mne7l/ecaYuc3gvsgFDpu2FXAFMWmRnb/+xW41qxHKI927KcGr0xGCWKO03cgxzq5k0gUmqHbQR1Q9aT4KiEJ9qc4K11zW2FI543IlpfPIUYSeXXOC0cj2MaQwhQpU3AOEblPOvkWz80OyW3lvRPADgSmzrKTNkd4iDUNbRsI4jB8HWJq2W3nGjiU9WCv12SU94tQRt015oxqae6Kww3gTnoUjeY6unOjZiXN7NCVmc+YFSyCKwafpl5Yk+kUSSGVb1dsuvNmYxp6j1112/yTUXl1scZqgmbHc6ODyGhMgDkuPqzW0IgulHoffn3OUuOzoyU4CIYLpZ+Qb9wE1tRbEifHTpK6it76ttA3C8QJIiWehstV3xJnM3C0Ki4DKvmllv0o55Z0jRBCqDq6sGJ51whel/GBHP4Ddfp/u2452GZ5HxjZJFdY8LqFJp3oS3RfprCJBSt1EUfILziiGj9APWKJGvmYh4qYqnxPE8pHJlh7VjcH1w3qVFGQYJ3DEGKcehATj2HEFgVknRniO0Q2uk8p4L1Em5u1VfRiVXojDKo1DL4HiFvtnF5fqWKCjCsctZtnfqRcz6br5tDlHaNU9vHhtBhwGrPpw== tom@asus-nixos EOT")
  }))

  default = {}
}
