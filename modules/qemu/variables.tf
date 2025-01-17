variable "qemu_vmid" {
  type        = number
  description = "ID unique de la VM QEMU."
}

variable "qemu_name" {
  type        = string
  description = "Nom de la VM QEMU dans Proxmox."
}

variable "target_node" {
  type        = string
  description = "Nom du nœud Proxmox cible (ex: pve1)."
}

variable "qemu_memory" {
  type        = number
  description = "Quantité de mémoire (en MB)."
  default     = 1024
}

variable "qemu_cores" {
  type        = number
  description = "Nombre de cœurs CPU par socket."
  default     = 1
}

variable "qemu_sockets" {
  type        = number
  description = "Nombre de sockets CPU."
  default     = 1
}

variable "qemu_cpu_type" {
  type        = string
  description = "Type de CPU (ex: kvm64, host, etc.)."
  default     = "kvm64"
}

variable "qemu_iso" {
  type        = string
  description = "Chemin vers l'ISO dans Proxmox (ex: 'local:iso/debian-12.iso')."
  default     = ""
}

variable "qemu_template" {
  type        = string
  description = "Nom/ID du template à cloner si vous utilisez le clonage."
  default     = ""
}

variable "qemu_disk_size" {
  type        = string
  description = "Taille du disque (ex: 10G)."
  default     = "10G"
}

variable "qemu_disk_type" {
  type        = string
  description = "Type de disque (ex: scsi, sata, virtio, etc.)."
  default     = "scsi"
}

variable "qemu_disk_storage" {
  type        = string
  description = "Nom du storage (ex: local-lvm, Storage2, etc.)."
  default     = "local-lvm"
}

variable "qemu_storage_type" {
  type        = string
  description = "Type de stockage (ex: lvm, qcow2, raw)."
  default     = "lvm"
}

variable "qemu_disk_format" {
  type        = string
  description = "Format du disque (ex: qcow2, raw)."
  default     = "qcow2"
}

# variable "qemu_disk_position" {
#   type        = string
#   description = "Position du disque sur le contrôleur (ex: 'scsi0', 'sata0')."
#   default     = "scsi0"
# }

variable "qemu_net_model" {
  type        = string
  description = "Modèle de carte réseau (ex: virtio, e1000, rtl8139)."
  default     = "virtio"
}

variable "qemu_net_bridge" {
  type        = string
  description = "Nom du bridge Proxmox à utiliser (ex: vmbr0)."
  default     = "vmbr0"
}

variable "qemu_net_vlan" {
  type        = number
  description = "ID VLAN (0 pour désactivé)."
  default     = 0
}

variable "qemu_net_firewall" {
  type        = bool
  description = "Activer le firewall Proxmox sur cette interface ?"
  default     = false
}

# variable "qemu_ssh_user" {
#   type        = string
#   description = "Nom d'utilisateur pour Cloud-Init."
#   default     = "root"
# }

variable "qemu_ssh_public_keys" {
  type        = string
  description = "Clés SSH publiques (multi-lignes si besoin)."
  default     = ""
}

variable "qemu_onboot" {
  type        = bool
  description = "Démarrer la VM automatiquement au boot de l'hôte ?"
  default     = true
}
