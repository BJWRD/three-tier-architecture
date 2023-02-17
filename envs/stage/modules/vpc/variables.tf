variable "project_name" {
  description = "Name of Project"
  type = string
}

variable "environment" {
  description = "Environment Type"
  type = string
}

variable "vpc_id" {
  description = "The VPC to be deployed"
  type = string
}

variable "vpc_cidr" {
  description = "The VPC Network Range"
  type = string
}

variable "public_subnet" {
  description = "A list of public subnets inside the VPC"
  type = map(string)
}

variable "private_subnet" {
  description = "A list of private subnets inside the VPC"
  type = map(string)
}

variable "database_subnet" {
  description = "A list of database subnets inside the VPC"
  type = map(string)
}

variable "availability_zones" {
  description = "Availability Zones used"
  type = list(string)
}

variable "cidr_block" {
  description = "CIDR Block to allow traffic via"
  type = string
}

variable "route_table_id" {
  description = "The ID of the Routing Table"
  type = string
}

variable "gateway_id" {
  description = "Identifier of the VPC Internet Gateway"
  type = string
}

variable "subnet_id" {
  description =  "subnet ID which resources will be launched in"
  type = string
}

variable "id_app" {
  description = "Launch Template ID"
  type = string
}

variable "load_balancer_type" {
  description = "The type of Load Balancer"
  type = string
}

variable "app_alb" {
  description = "Name of Application Load Balancer"
  type = string
}

variable "alb_internal" {
  description = "Application Load Balancer Network Type"
  type = string 
}

variable "load_balancer_arn" {
  description = "Application Load Balancer ARN"
  type = string
}

variable "alb_listener_port" {
  description = "Application Load Balancer Listener Port"
  type = string
}

variable "alb_listener_protocol" {
  description = "Application Load Balancer Listener Protocol"
  type = string
}

variable "alb_listener_type" {
  description = "Application Load Balancer Listener Type"
  type =string
}

variable "alb_target_group_arn" {
  description = "Application Load Balancer Target Group ARN"
  type = string
}

variable "alb_target_group" {
  description = "Application Load Balancer Target Group"
  type = string
}

variable "alb_target_group_port" {
  description = "Application Load Balancer Target Group Port"
  type = string
}

variable "alb_target_group_protocol" {
  description = "Application Load Balancer Target Protocol"
  type = string
}

variable "app_autoscaling_group" {
  description = "Autoscaling Group Name"
  type = string
}

variable "desired_capacity" {
  description = "The number of EC2 instances that should be running in the group"
  type = string
}

variable "max_size" {
  description = "The maximum size of the autoscale group"
  type = string
}

variable "min_size" {
  description = "The minimum size of the autoscale group"
  type = string
}

variable "db_subnet_group_name" {
  description = "Database Subnet Group Name"
  type = string
}

variable "alb_security_group_name" {
  description = "Application Load Balancer App Security Group Name"
  type = string
}

variable "app_security_group_name" {
  description = "App Instance Security Group Name"
  type = string
}

variable "db_security_group_name" {
  description = "Database Security Group Name"
  type = string
}

variable "alb_security_group" {
  description = "Application Load Balancer Security Group"
  type = string
}

variable "app_security_group" {
  description = "Application Security Group"
  type = string
}
