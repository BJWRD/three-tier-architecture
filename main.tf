provider "aws" {
  region = var.region
}

module "vpc" {
  source                      = "./modules/vpc"
  project_name                = var.project_name
  environment                 = var.environment
  vpc_id                      = var.vpc_id
  vpc_cidr                    = var.vpc_cidr
  public_subnet               = var.public_subnet
  private_subnet              = var.private_subnet
  database_subnet             = var.database_subnet
  availability_zones          = var.availability_zones
  cidr_block                  = var.cidr_block
  route_table_id              = var.route_table_id
  gateway_id                  = var.gateway_id
  subnet_id                   = var.subnet_id
  id_app                      = module.ec2.id_app
  load_balancer_type          = var.load_balancer_type
  security_group_alb_sg       = module.vpc.security_group_alb_sg
  app_alb                     = var.app_alb
  alb_internal                = var.alb_internal
  load_balancer_arn           = var.load_balancer_arn
  alb_listener_port           = var.alb_listener_port
  alb_listener_protocol       = var.alb_listener_protocol
  alb_listener_type           = var.alb_listener_type
  alb_target_group_arn        = var.alb_target_group_arn
  alb_target_group            = var.alb_target_group
  alb_target_group_port       = var.alb_target_group_port
  alb_target_group_protocol   = var.alb_target_group_protocol
  app_autoscaling_group       = var.app_autoscaling_group
  desired_capacity            = var.desired_capacity
  max_size                    = var.max_size
  min_size                    = var.min_size
  database_subnet_group       = var.database_subnet_group
  alb_app_security_group      = var.alb_app_security_group
  app_instance_security_group = var.app_instance_security_group
  db_security_group           = var.db_security_group
}

module "ec2" {
  source                 = "./modules/ec2"
  project_name           = var.project_name
  environment            = var.environment
  image_id               = var.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = module.vpc.vpc_security_group_ids
  id_app                 = var.id_app
  name_prefix            = var.name_prefix
}

module "rds" {
  source                               = "./modules/rds"
  project_name                         = var.project_name
  environment                          = var.environment
  engine_name                          = var.engine_name
  engine_version                       = var.engine_version
  storage                              = var.storage
  db_subnet_group_name                 = module.vpc.db_subnet_group_name
  identifier                           = var.identifier
  instance_class                       = var.instance_class
  multi_az                             = var.multi_az
  database_name                        = var.database_name
  database_username                    = var.database_username
  database_password                    = var.database_password
  database_port                        = var.database_port
  publicly_accessible                  = var.publicly_accessible
  db_security_group                    = module.vpc.security_group_db_sg
  database_snapshot                    = var.database_snapshot
}
