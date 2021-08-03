variable "aws_security_group_db_security_group" {
  type = string
}

variable "aws_db_subnet_group_db_subnet" {
  type = string
}

variable "engine_name" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "storage" {
  type = string
}

variable "identifier" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "multi_az" {
  type = string
}

variable "database_name" {
  type = string
}

variable "database_username" {
  type = string
}

variable "database_password" {
  type = string
}

variable "database_port" {
  type = string
}

variable "publicly_accessible" {
  type = string
}

variable "database_snapshot" {
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
