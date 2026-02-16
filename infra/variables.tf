variable "location" {
  description = "Azure region"
  type        = string
  default     = "westeurope"
}

variable "project_name" {
  description = "Project base name"
  type        = string
  default     = "bookloan"
}

variable "environment" {
  description = "Environment name (dev, test, prod)"
  type        = string
  default     = "dev"
}

variable "service_image" {
  description = "Service image full ref, e.g. <acr>.azurecr.io/book-loan-service:latest"
  type        = string
}

variable "consumer_image" {
  description = "Consumer image full ref, e.g. <acr>.azurecr.io/book-loan-consumer:latest"
  type        = string
}

variable "suffix" {
  description = "Stable suffix for naming. Must match existing deployed resources."
  type        = string
  default     = "9m2mo5"
}
