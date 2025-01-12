variable "lxc_vmid" {
  type        = number
  description = "ID unique pour le conteneur cloné."
}

variable "lxc_hostname" {
  type        = string
  description = "Nom du conteneur cloné."
}

variable "template_id" {
  type        = string
  description = "ID ou nom du template à cloner."
  default     = "298"
}

variable "target_node" {
  type        = string
  description = "Node Proxmox cible pour le conteneur cloné."
}

variable "lxc_cores" {
  type        = number
  description = "Nombre de coeurs CPU pour le conteneur."
  default     = 1
}

variable "lxc_memory" {
  type        = number
  description = "Mémoire allouée au conteneur (en MB)."
  default     = 512
}

variable "lxc_password" {
  type        = string
  description = "Mot de passe root pour le conteneur cloné."
  sensitive   = true
}

variable "unprivileged" {
  type        = bool
  description = "Définit si le conteneur est unprivileged (true) ou privileged (false)."
  default     = true
}

variable "lxc_storage" {
  type        = string
  description = "Nom du stockage pour le rootfs."
  default     = "local"
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
  description = "Pont réseau à utiliser pour le conteneur."
  default     = "vmbr0"
}

variable "network_ip" {
  type        = string
  description = "Adresse IP (DHCP ou statique) pour le conteneur."
  default     = "dhcp"
}

variable "network_gateway" {
  type        = string
  description = "Passerelle réseau pour le conteneur."
}

variable "network_firewall" {
  type        = bool
  description = "Activer le firewall Proxmox sur cette interface ?"
  default     = false
}

variable "ssh_public_key" {
  type        = string
  description = "Clés publiques SSH pour le compte root du conteneur."
}
