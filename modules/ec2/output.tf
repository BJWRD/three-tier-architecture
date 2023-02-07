output "id_app" {
  description = "Launch Template ID"
  value = aws_launch_template.main.id
}

output "instance_ip_addr"
  description = "The private IP address of the main server instance."
  value = aws_launch_template.public_ip