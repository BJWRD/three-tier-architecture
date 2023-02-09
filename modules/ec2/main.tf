locals {
  required_tags = {
    project     = var.project_name,
    environment = var.environment
  }
}

# App - Launch Template
resource "aws_launch_template" "main" {
  name_prefix            = var.name_prefix
  image_id               = var.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.app_security_group]
  user_data              = filebase64("./modules/ec2/install.sh")

  tags = local.required_tags
}
