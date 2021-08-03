variable "image_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "vpc_security_group_ids" {
  type = string
}

variable "id_app" {
  type = string
}

variable "name_prefix" {
  type    = string
  default = "app-launch-template"
}

variable "resource_tags" {
  description = "Tags to set for all EC2 resources"
  type        = map(string)
  default     = {}
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}
