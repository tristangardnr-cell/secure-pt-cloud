variable "aws_region" {
  description = "AWS region for SecurePT Cloud resources."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used for AWS resource naming and tags."
  type        = string
  default     = "secure-pt-cloud"
}

variable "vpc_cidr" {
  description = "CIDR block for the SecurePT Cloud VPC."
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.20.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet."
  type        = string
  default     = "10.20.10.0/24"
}
