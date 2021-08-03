locals {
  name_suffix = "${var.project_name}-${var.environment}"
}

locals {
  required_tags = {
    project     = var.project_name,
    environment = var.environment,
  }
  tags = merge(var.resource_tags, local.required_tags)
}

#VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = merge(local.tags, { Name = "VPC" })
}

#Internet gateway for the public subnet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(local.tags, { Name = "Internet-Gateway" })
}

#Public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  for_each                = var.az_public_subnet
  availability_zone       = each.key
  cidr_block              = each.value
  map_public_ip_on_launch = "true" #makes this a public subnet

  tags = merge(local.tags, { Name = "Public-Subnet" })
}

# Route table for public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(local.tags, { Name = "Public-Route-Table" })
}

#aws_route adds a route to the aws_route_table
resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = aws_internet_gateway.igw.id
}

#Route table associations
resource "aws_route_table_association" "public" {
  for_each       = var.az_public_subnet
  subnet_id      = aws_subnet.public_subnet[each.key].id
  route_table_id = aws_route_table.public.id
}

#Private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  for_each          = var.az_private_subnet
  availability_zone = each.key
  cidr_block        = each.value

  tags = merge(local.tags, { Name = "Private-Subnet" })
}

# App - Application Load Balancer
resource "aws_lb" "app_app_lb" {
  name               = var.app_alb_lb
  internal           = false
  load_balancer_type = var.load_balancer_type
  security_groups    = [var.security_group_alb_app_http]
  subnets            = [for value in aws_subnet.public_subnet : value.id]

  tags = merge(local.tags, { Name = "Application-ALB" })
}

# App - Listener
resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app_app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_target_group.arn
  }
}

# App - Target Group
resource "aws_lb_target_group" "app_target_group" {
  name     = var.app_target_group
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  health_check {
    port     = 80
    protocol = "HTTP"
  }
}

# App - Auto Scaling Group
resource "aws_autoscaling_group" "app_asg" {
  name                = var.app_autoscaling_group
  desired_capacity    = 1
  max_size            = 1
  min_size            = 1
  target_group_arns   = [aws_lb_target_group.app_target_group.arn]
  vpc_zone_identifier = [for value in aws_subnet.public_subnet : value.id]

  launch_template {
    id      = var.id_app
    version = "$Latest"
  }
}

# Database Subnet
resource "aws_subnet" "database_subnet" {
  vpc_id            = aws_vpc.vpc.id
  for_each          = var.az_database_subnet
  availability_zone = each.key
  cidr_block        = each.value

  tags = merge(local.tags, { Name = "Database-Subnet" })
}

# DB - Subnet Group
resource "aws_db_subnet_group" "db_subnet" {
  name       = var.database_subnet_group
  subnet_ids = [for value in aws_subnet.database_subnet : value.id]

  tags = merge(local.tags, { Name = "Database-Subnet-Group" })
}
