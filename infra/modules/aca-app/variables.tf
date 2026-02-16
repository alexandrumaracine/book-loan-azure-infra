variable "name" { type = string }

variable "resource_group_name" { type = string }
variable "location" { type = string }

variable "environment_id" {
  description = "Container Apps Environment ID."
  type        = string
}

variable "identity_id" {
  description = "User-assigned managed identity ID."
  type        = string
}

variable "acr_login_server" {
  description = "ACR login server, e.g. xxx.azurecr.io"
  type        = string
}

variable "image" {
  description = "Full image reference. Typically: <acr_login_server>/<repo>:<tag>"
  type        = string
}

variable "cpu" {
  type    = number
  default = 0.5
}

variable "memory" {
  description = "Memory string like 1Gi, 0.5Gi"
  type        = string
  default     = "1Gi"
}

variable "env" {
  description = "Environment variables for the container."
  type        = map(string)
  default     = {}
}
