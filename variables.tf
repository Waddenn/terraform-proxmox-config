variable "pm_api_url" {
  description = "URL de l'API Proxmox"
  type        = string
  default     = "https://192.168.1.1:8006/api2/json"
}

variable "pm_password" {
  description = "Mot de passe root pour accéder à l'API Proxmox"
  type        = string
}

variable "lxc_hostname" {
  description = "Nom du conteneur LXC"
  type        = string
  default     = "test-lxc"
}

variable "lxc_memory" {
  description = "Mémoire allouée au conteneur (en Mo)"
  type        = number
  default     = 512
}

variable "lxc_cores" {
  description = "Nombre de cœurs CPU alloués"
  type        = number
  default     = 1
}

variable "api_token" {
  description = "Token API pour l'utilisateur Terraform"
  type        = string
}
