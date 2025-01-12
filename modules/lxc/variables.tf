# modules/lxc/variables.tf

variable "lxc_vmid" {
  type        = number
  description = "ID unique pour le conteneur LXC."
}

variable "lxc_hostname" {
  type        = string
  description = "Nom du conteneur LXC."
}

variable "lxc_ostemplate" {
  type        = string
  description = "OStemplate à utiliser pour le conteneur."
  default     = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
}

variable "target_node" {
  type        = string
  description = "Node Proxmox cible."
}

variable "lxc_cores" {
  type        = number
  description = "Nombre de coeurs CPU."
  default     = 1
}

variable "lxc_memory" {
  type        = number
  description = "Mémoire allouée (MB)."
  default     = 512
}

variable "lxc_password" {
  type        = string
  description = "Mot de passe root du conteneur."
  sensitive   = true
}

variable "unprivileged" {
  type        = bool
  description = "Définit si le conteneur est unprivileged (true) ou privileged (false)."
  default     = true
}

variable "lxc_storage" {
  type        = string
  description = "Nom du storage pour le rootfs."
  default     = "Storage2"
}

variable "lxc_rootfs_size" {
  type        = string
  description = "Taille du rootfs (ex: 8G)."
  default     = "8G"
}

variable "network_name" {
  type        = string
  description = "Nom de l'interface réseau dans le conteneur."
  default     = "eth0"
}

variable "network_bridge" {
  type        = string
  description = "Pont réseau à utiliser."
  default     = "vmbr0"
}

variable "network_ip" {
  type        = string
  description = "Adresse IP (DHCP ou statique)."
  default     = "dhcp"
}

variable "network_gateway" {
  type        = string
  description = "Passerelle réseau pour les conteneurs."
}

variable "network_firewall" {
  type        = bool
  description = "Activer le firewall Proxmox sur cette interface ?"
  default     = false
}

variable "features_nesting" {
  type        = bool
  description = "Activer le nesting"
  default     = true
}

variable "ssh_public_key" {
  type        = string
  description = "Clés publiques SSH pour le compte root du conteneur."
}

variable "console_mode" {
  type        = string
  description = "Mode de console pour le conteneur (ex: tty ou /dev/console)."
  default     = "/dev/console"
}
