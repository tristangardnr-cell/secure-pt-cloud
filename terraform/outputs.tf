output "vpc_id" {
  description = "ID of the SecurePT Cloud VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the public subnet."
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID of the private subnet."
  value       = aws_subnet.private.id
}

output "public_web_security_group_id" {
  description = "ID of the public web security group."
  value       = aws_security_group.public_web.id
}

output "private_backend_security_group_id" {
  description = "ID of the private backend security group."
  value       = aws_security_group.private_backend.id
}

output "private_backend_instance_id" {
  description = "ID of the private backend EC2 instance."
  value       = aws_instance.private_backend.id
}
