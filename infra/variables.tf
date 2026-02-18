variable "location" {
  description = "Azure region"
  type        = string
  default     = "westeurope"
}

variable "project_name" {
  description = "Project base name"
  type        = string
  default     = "book-loan"
}

variable "project_code" {
  type    = string
  default = "bl"
}

variable "service_image" {
  description = "Service image full ref, e.g. <acr>.azurecr.io/book-loan-service:latest"
  type        = string
}

variable "consumer_image" {
  description = "Consumer image full ref, e.g. <acr>.azurecr.io/book-loan-consumer:latest"
  type        = string
}

variable "subscription_id" { type = string }
variable "tenant_id"       { type = string }
variable "client_id"       { type = string }
