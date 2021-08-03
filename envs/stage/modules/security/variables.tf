variable "vpc_id" {
  type = string
}

variable "cidr_blocks" {
  type = string
}

variable "resource_tags" {
  description = "Tags to set for RDS resource"
  type        = map(string)
  default     = {}
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "alb_app_security_group" {
  type = string
}

variable "app_instance_security_group" {
  type = string
}

variable "db_security_group" {
  type = string
}
