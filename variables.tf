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
