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

# DB - RDS Instance
resource "aws_db_instance" "db_mysql" {
  engine                 = var.engine_name
  engine_version         = var.engine_version
  allocated_storage      = var.storage #GB
  db_subnet_group_name   = var.aws_db_subnet_group_db_subnet
  identifier             = var.identifier
  instance_class         = var.instance_class
  multi_az               = var.multi_az
  name                   = var.database_name
  username               = var.database_username
  password               = var.database_password
  port                   = var.database_port
  publicly_accessible    = var.publicly_accessible
  vpc_security_group_ids = [var.aws_security_group_db_security_group]
  skip_final_snapshot    = var.database_snapshot

  tags = local.tags
}
