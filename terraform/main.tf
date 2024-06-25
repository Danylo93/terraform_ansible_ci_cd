provider "aws" {
  region = var.region
}

resource "aws_security_group" "acesso_geral" {
  name        = "acesso_geral"
  description = "Acesso geral"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_instance" "backend" {
  ami           = var.amis["us-east-1-ubuntu18"]
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.main.id

  tags = {
    Name = "backend_instance"
  }

  vpc_security_group_ids = [aws_security_group.acesso_geral.id]
}

resource "aws_instance" "frontend" {
  ami           = var.amis["us-east-1-ubuntu18"]
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.main.id

  tags = {
    Name = "frontend_instance"
  }

  vpc_security_group_ids = [aws_security_group.acesso_geral.id]
}

output "backend_instance_ip" {
  value = aws_instance.backend.public_ip
}

output "frontend_instance_ip" {
  value = aws_instance.frontend.public_ip
}
