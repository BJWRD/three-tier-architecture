variable "project_name" {
  description = "Name of Project"
  type = string
}

variable "environment" {
  description = "Environment Type"
  type = string
}

variable "image_id" {
  description = "Image ID"
  type = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type = string
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type = string
}

variable "name_prefix" {
  description = "Name of Launch Template"
  type    = string
}
