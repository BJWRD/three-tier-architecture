variable "region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "Name of Project"
  type        = string
  default     = "three-tier-architecture"
}

variable "environment" {
  description = "Environment Type"
  type        = string
  default     = "prod"
}

################################################################################
# VPC Module - Variables 
################################################################################

variable "vpc_id" {
  description = "The VPC to be deployed"
  type        = string
  default     = "aws_vpc.main.id"
}

variable "vpc_cidr" {
  description = "The VPC Network Range"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet" {
  description = "A list of public subnets inside the VPC"
  type        = map(string)
  default = {
    "eu-west-2a" : "10.0.0.0/24",
    "eu-west-2b" : "10.0.1.0/24",
    "eu-west-2c" : "10.0.2.0/24"
  }
}

variable "private_subnet" {
  description = "A list of private subnets inside the VPC"
  type        = map(string)
  default = {
    "eu-west-2a" : "10.0.101.0/24",
    "eu-west-2b" : "10.0.102.0/24",
    "eu-west-2c" : "10.0.103.0/24"
  }
}

variable "database_subnet" {
  description = "A list of database subnets inside the VPC"
  type        = map(string)
  default = {
    "eu-west-2a" : "10.0.201.0/24",
    "eu-west-2b" : "10.0.202.0/24",
    "eu-west-2c" : "10.0.203.0/24"
  }
}

variable "availability_zones" {
  description = "Availability Zones used"
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "cidr_block" {
  description = "CIDR Block to allow traffic via"
  type        = string
  default     = "0.0.0.0/0"
}

variable "route_table_id" {
  description = "The ID of the Routing Table"
  type        = string
  default     = "aws_route_table.main[each.key].id"
}

variable "gateway_id" {
  description = "Identifier of the VPC Internet Gateway"
  type        = string
  default     = "aws_internet_gateway.main.id"
}

variable "subnet_id" {
  description = "subnet ID which resources will be launched in"
  type        = string
  default     = "aws_subnet.public_subnet.id"
}

variable "load_balancer_type" {
  description = "The type of Load Balancer"
  type        = string
  default     = "application"
}

variable "app_alb" {
  description = "Name of Application Load Balancer"
  type        = string
  default     = "app-alb"
}

variable "alb_internal" {
  description = "Application Load Balancer Network Type"
  type        = string
  default     = "false"
}

variable "load_balancer_arn" {
  description = "Application Load Balancer ARN"
  type        = string
  default     = "aws_lb.main.arn"
}

variable "alb_listener_port" {
  description = "Application Load Balancer Listener Port"
  type        = string
  default     = "80"
}

variable "alb_listener_protocol" {
  description = "Application Load Balancer Listener Protocol"
  type        = string
  default     = "HTTP"
}

variable "alb_listener_type" {
  description = "Application Load Balancer Listener Type"
  type        = string
  default     = "forward"
}

variable "alb_target_group_arn" {
  description = "Application Load Balancer Target Group ARN"
  type        = string
  default     = "aws_lb_target_group.main.arn"
}

variable "alb_target_group" {
  description = "Application Load Balancer Target Group"
  type        = string
  default     = "alb-target-group"
}

variable "alb_target_group_port" {
  description = "Application Load Balancer Target Group Port"
  type        = string
  default     = "80"
}

variable "alb_target_group_protocol" {
  description = "Application Load Balancer Target Group Protocol"
  type        = string
  default     = "HTTP"
}

variable "app_autoscaling_group" {
  description = "Autoscaling Group Name"
  type        = string
  default     = "app-autoscaling-group"
}

variable "desired_capacity" {
  description = "The number of EC2 instances that should be running in the group"
  type        = string
  default     = "3"
}

variable "max_size" {
  description = "The maximum size of the autoscale group"
  type        = string
  default     = "3"
}

variable "min_size" {
  description = "The minimum size of the autoscale group"
  type        = string
  default     = "3"
}

variable "db_subnet_group_name" {
  description = "Database Subnet Group"
  type        = string
  default     = "aws_db_subnet_group.main.id"
}

variable "alb_security_group_name" {
  description = "Application Load Balancer App Security Group Name"
  type        = string
  default     = "alb-app-security-group"
}

variable "app_security_group_name" {
  description = "App Instance Security Group Name"
  type        = string
  default     = "app-instance-security-group"
}

variable "db_security_group_name" {
  description = "Database Security Group Name"
  type        = string
  default     = "db-security-group"
}

variable "alb_security_group" {
  description = "Application Load Balancer Security Group"
  type        = string
  default     = "aws_security_group.alb_security_group.id"
}

variable "app_security_group" {
  description = "Application Security Group"
  type        = string
  default     = "aws_security_group.app_security_group.id"
}

################################################################################
# EC2 Module - Variables 
################################################################################

variable "image_id" {
  description = "Image ID"
  type        = string
  default     = "ami-084e8c05825742534"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.large"
}

variable "name_prefix" {
  description = "Name of Launch Template"
  type        = string
  default     = "app-launch-template"
}

variable "id_app" {
  description = "Launch Template ID"
  type        = string
  default     = "aws_launch_template.main.id"
}

variable "key_name" {
  description = "Name of the Private Key to be used for the EC2 Instance"
  type        = string
  default     = "terraform"
}

variable "connection_type" {
  description = "The type of connection used for the EC2 Instance"
  type        = string
  default     = "ssh"
}

variable "connection_user" {
  description = "EC2 User"
  type        = string
  default     = "ec2-user"
}

variable "connection_host" {
  description = "Allows connection to the newly created EC2 Instances"
  type        = string
  default     = "self.public_ip"
}

################################################################################
# RDS Module - Variables 
################################################################################

variable "engine_name" {
  description = "Database Type"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Database Version"
  type        = string
  default     = "8.0"
}

variable "storage" {
  description = "GB Storage"
  type        = string
  default     = "50"
}

variable "identifier" {
  description = "Database Identifier"
  type        = string
  default     = "db-mysql-dev"
}

variable "instance_class" {
  description = "Instance Type of the Database"
  type        = string
  default     = "db.t2.large"
}

variable "multi_az" {
  description = "Database across multiple Availability Zones"
  type        = string
  default     = "true"
}

variable "database_name" {
  description = "Database Name"
  type        = string
  default     = "dbmysql"
}

variable "database_username" {
  description = "Database Username"
  type        = string
  default     = "dbadmin"
}

variable "database_password" {
  description = "Database Password"
  sensitive   = "true"
  type        = string
  default     = "S0methingS3cure!"
}

variable "database_port" {
  description = "Database Port"
  type        = string
  default     = "3306"
}

variable "publicly_accessible" {
  description = "Database publicly accessible"
  type        = string
  default     = "false"
}

variable "db_security_group" {
  description = "Database Security Group"
  type        = string
  default     = "aws_security_group.db_security_group.id"
}

variable "database_snapshot" {
  description = "Snapshot of the Database"
  type        = string
  default     = "true"
}