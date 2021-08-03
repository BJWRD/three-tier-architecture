variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "az_public_subnet" {
  type = map(string)
}

variable "az_private_subnet" {
  type = map(string)
}

variable "az_database_subnet" {
  type = map(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "route_table_id" {
  type = string
}

variable "gateway_id" {
  type = string
}

variable "destination_cidr_block" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "aws_subnet_public_subnet" {
  type = string
}

variable "aws_subnet_private_subnet" {
  type = string
}

variable "id_app" {
  type = string
}

variable "load_balancer_type" {
  type = string
}

variable "security_group_alb_app_http" {
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

variable "app_alb_lb" {
  type = string
}

variable "app_target_group" {
  type = string
}

variable "app_autoscaling_group" {
  type = string
}

variable "database_subnet_group" {
  type = string
}
