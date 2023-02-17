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

variable "app_security_group" {
  description = "Application Security Group"
  type = string
}

variable "name_prefix" {
  description = "Name of Launch Template"
  type    = string
}

variable "key_name" {
  description = "Name of the Private Key to be used for the EC2 Instance"
  type = string
}

variable "connection_type" {
  description = "The type of connection used for the EC2 Instance"
  type = string
}

variable "connection_user" {
  description = "EC2 User"
  type = string
}

variable "connection_host" {
  description = "Allows connection to the newly created EC2 Instances"
  type = string
}