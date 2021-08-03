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

# App - ALB Security Group
resource "aws_security_group" "alb_app_http" {
  name        = var.alb_app_security_group
  description = "Allowing HTTP requests to the app tier application load balancer"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_blocks]
  }

  tags = local.tags
}

# App - EC2 Instance Security Group
resource "aws_security_group" "app_instance_sg" {
  name        = var.app_instance_security_group
  description = "Allowing requests to the app servers"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_app_http.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_blocks]
  }

  tags = local.tags
}

# DB - Security Group
resource "aws_security_group" "db_security_group" {
  name        = var.db_security_group
  description = "RDS mysql server"
  vpc_id      = var.vpc_id

  # Only MySQL in
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    description     = "MySQL access from within VPC"
    security_groups = [aws_security_group.app_instance_sg.id]
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_blocks]
  }

  tags = local.tags
}
