#variables.tf

variable "pm_api_url" {
  type        = string
  default     = "https://192.168.1.1:8006/api2/json"
}

variable "pm_api_token_id" {
  type        = string
  default     = "terraform-prov@pve!terraform"
}

variable "pm_api_token_secret" {
  type        = string
  sensitive   = true
}

variable "pm_tls_insecure" {
  type        = bool
  default     = true
}

variable "lxc_password_a" {
  type        = string
  sensitive   = true
  description = "Mot de passe root pour le conteneur A"
}

variable "lxc_password_b" {
  type        = string
  sensitive   = true
  description = "Mot de passe root pour le conteneur B"
}

variable "lxc_password_c" {
  type        = string
  sensitive   = true
  description = "Mot de passe root pour le conteneur B"
}

variable "lxc_password_d" {
  type        = string
  sensitive   = true
  description = "Mot de passe root pour le conteneur B"
}
