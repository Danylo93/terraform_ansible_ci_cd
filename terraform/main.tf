resource "aws_instance" "backend" {
  ami                    = var.amis[var.region]
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = data.aws_subnet.default.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.acesso_geral.id]

  tags = {
    Name = "backend-instance"
  }
}

resource "aws_instance" "frontend" {
  ami                    = var.amis[var.region]
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = data.aws_subnet.default.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.acesso_geral.id]

  tags = {
    Name = "frontend-instance"
  }
}
