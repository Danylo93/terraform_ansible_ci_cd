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
