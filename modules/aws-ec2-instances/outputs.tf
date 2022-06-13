# Output variable definitions
output "name" {
  description = "Name (id) of the ec2"
  value       = aws_instance.ec2_instance.id
}

