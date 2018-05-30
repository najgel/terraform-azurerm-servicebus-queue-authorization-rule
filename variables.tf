variable queue_list {
  type = "list"
}

variable resource_group_name {
  description = "The resource group the service bus resides in"
}

variable sb_name {
  description = "The name of the service bus"
}

variable "rule_name" {
  description = "The name of the rule"
}

variable "location" {
  description = "The azure data center location"
}

variable "claims" {
  type        = "list"
  description = "a list with the claims you want the rule to have. Valid claims are listen, send and manage."
}
