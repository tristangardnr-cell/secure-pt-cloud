data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "private_backend" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.backend_instance_type
  subnet_id                   = aws_subnet.private.id
  vpc_security_group_ids      = [aws_security_group.private_backend.id]
  associate_public_ip_address = false

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  root_block_device {
    encrypted   = true
    volume_type = "gp3"
    volume_size = 8

    tags = merge(local.common_tags, {
      Name            = "${var.project_name}-private-backend-root-volume"
      DataSensitivity = "demo-healthcare-backend"
      Encryption      = "enabled"
    })
  }

  tags = merge(local.common_tags, {
    Name            = "${var.project_name}-private-backend"
    Tier            = "private"
    Role            = "backend-demo-server"
    DataSensitivity = "demo-healthcare-backend"
  })
}
