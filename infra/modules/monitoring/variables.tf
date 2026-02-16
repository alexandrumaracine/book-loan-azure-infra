variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "name_prefix" {
  type        = string
  description = "Base name prefix for monitoring resources"
}

variable "retention_in_days" {
  type        = number
  description = "Log Analytics retention in days"
  default     = 30
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to resources"
  default     = {}
}
