variable "pm_api_url" {
  description = "URL de l'API Proxmox"
  type        = string
  default     = "https://192.168.1.1:8006/api2/json"
}

variable "pm_api_token_id" {
  description = "ID du token API (ex: 'terraform-prov@pve!terraform')"
  type        = string
  default     = "terraform-prov@pve!terraform"
}

variable "pm_api_token_secret" {
  description = "Secret du token API"
  type        = string
  sensitive   = true
}

variable "pm_tls_insecure" {
  description = "Accepter un certificat SSL invalide pour Proxmox ?"
  type        = bool
  default     = true
}

variable "lxc_hostname" {
  description = "Nom du conteneur LXC"
  type        = string
  default     = "test-lxc"
}

variable "lxc_cores" {
  description = "Nombre de coeurs CPU alloués"
  type        = number
  default     = 1
}

variable "lxc_memory" {
  description = "Mémoire allouée au conteneur (en Mo)"
  type        = number
  default     = 512
}

variable "lxc_password" {
  description = "Mot de passe root pour le conteneur LXC"
  type        = string
  sensitive   = true
}

variable "target_node" {
  description = "Nom du node Proxmox sur lequel déployer le conteneur"
  type        = string
  default     = "proxade"
}

variable "lxc_ostemplate" {
  description = "OStemplate LXC utilisé pour la création du conteneur"
  type        = string
  default     = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
}

variable "lxc_storage" {
  description = "Storage où sera stocké le rootfs du conteneur"
  type        = string
  default     = "Storage2"
}

variable "lxc_rootfs_size" {
  description = "Taille de la partition rootfs du conteneur"
  type        = string
  default     = "8G"
}
