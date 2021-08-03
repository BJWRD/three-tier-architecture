output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "aws_db_subnet_group_db_subnet" {
  value = aws_db_subnet_group.db_subnet.id
}
