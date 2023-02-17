output "vpc_id" {
  description = "The VPC to be deployed"
  value = aws_vpc.main.id
}

output "gateway_id" {
  description = "Identifier of the VPC Internet Gateway" 
  value = aws_internet_gateway.main.id
}

output "aws_db_subnet_group_main" {
  description = "Database Subnet Group"
  value = aws_db_subnet_group.main.id
}

output "app_security_group" {
  description = "App Instance Security Group"
  value = aws_security_group.app_security_group.id
}

output "alb_security_group" {
  description = "Application Load Balancer Security Group"
  value = aws_security_group.alb_security_group.id
}

output "db_security_group" {
  description = "Database Security Group"
  value = aws_security_group.db_security_group.id
}
