# modules/qemu/variables.tf

variable "vm_name" {
  type        = string
  description = "Nom de la VM"
}

variable "vm_id" {
  type        = number
  description = "ID unique pour la VM"
}

variable "target_node" {
  type        = string
  description = "Node Proxmox cible"
}

variable "iso_file" {
  type        = string
  description = "Chemin de l'ISO dans le storage Proxmox (ex: local:iso/debian-12.0.0-amd64-netinst.iso)"
  default = null
}

variable "cores" {
  type        = number
  description = "Nombre de coeurs CPU"
  default     = 2
}

variable "sockets" {
  type        = number
  description = "Nombre de sockets CPU"
  default     = 1
}

variable "memory" {
  type        = number
  description = "Mémoire RAM en MB"
  default     = 2048
}

variable "bios" {
  type        = string
  description = "Type de BIOS (ovmf pour UEFI ou seabios)"
  default     = "seabios"
}

variable "start_on_boot" {
  type        = bool
  description = "Démarrer la VM au boot du serveur"
  default     = true
}

# variable "start_on_create" {
#   type        = bool
#   description = "Démarrer la VM après sa création"
#   default     = true
# }

variable "qemu_agent" {
  type        = bool
  description = "Activer l'agent QEMU"
  default     = true
}

variable "network_bridge" {
  type        = string
  description = "Pont réseau à utiliser"
  default     = "vmbr0"
}

variable "network_firewall" {
  type        = bool
  description = "Activer le firewall sur l'interface"
  default     = false
}

variable "disk_storage" {
  type        = string
  description = "Storage pool pour le disque"
}

variable "disk_size" {
  type        = string
  description = "Taille du disque (ex: 32G)"
}

variable "disk_format" {
  type        = string
  description = "Format du disque (raw, qcow2)"
  default     = "raw"
}
