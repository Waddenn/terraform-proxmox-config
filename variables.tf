#variables.tf

variable "pm_api_url" {
  description = "URL of the Proxmox API"
  type        = string
  default     = "https://192.168.1.1:8006/api2/json"
}

variable "pm_api_token_id" {
  description = "API Token ID for Proxmox"
  type        = string
  default     = "terraform-prov@pve!terraform"
}

variable "pm_api_token_secret" {
  description = "API Token Secret for Proxmox"
  type        = string
  sensitive   = true
}

variable "pm_tls_insecure" {
  description = "Ignore TLS Errors"
  type        = bool
  default     = true
}

variable "ssh_public_key" {
  description = "SSH Public Key to inject into containers"
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILDWrexcT0dL92oAYuMxLpS+2WxBzwYA38C/paRGsZ2i tom@asus-nixos"
}
