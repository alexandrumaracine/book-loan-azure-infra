variable "name" {
  description = "ACR name (must be globally unique, 5-50 chars, lowercase alphanumeric)."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}
