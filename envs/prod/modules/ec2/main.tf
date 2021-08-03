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

# App - Launch Template
resource "aws_launch_template" "app_launch_template" {
  name_prefix            = var.name_prefix
  image_id               = var.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.vpc_security_group_ids]

  tags = local.tags
}
