output "vpc_id" {
  description = "The VPC to be deployed"
  value = aws_vpc.main.id
}

output "db_subnet_group" {
  description = "Database Subnet Group"
  value = aws_db_subnet_group.main.id
}

output "security_group_app_sg" {
  description = "App Instance Security Group"
  value = aws_security_group.app_sg.id
}

output "security_group_alb_sg" {
  description = "Application Load Balancer Security Group"
  value = aws_security_group.alb_sg.id
}

output "security_group_db_sg {
  description = "Database Security Group"
  value = aws_security_group.db_sg.id
}
