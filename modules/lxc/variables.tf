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
    cores        = optional(number, 1)
    memory       = optional(number, 512)
    password     = optional(string, null)
    unprivileged = optional(bool, true)
    console_mode = optional(string, "tty")
    ostype       = optional(string, "debian")

    # RootFS
    rootfs_storage = optional(string, "local-lvm")
    rootfs_size    = optional(string, "8G")

    # Réseau (un seul bloc network ici, mais on peut l'étendre si besoin)
    network = optional(object({
      name     = optional(string, "eth0")
      bridge   = optional(string, "vmbr0")
      ip       = optional(string, "dhcp")
      gateway  = optional(string, "")
      firewall = optional(bool, false)
    }), {
      name     = "eth0"
      bridge   = "vmbr0"
      ip       = "dhcp"
      gateway  = ""
      firewall = false
    })

    # Features
    features = optional(object({
      nesting = optional(bool, false)
    }), {
      nesting = false
    })

    # SSH Public Keys
    ssh_public_keys = optional(string, "")
  }))

  default = {}
}
