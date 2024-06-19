provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "maquina_wp" {
  ami           = var.amis["us-east-1-ubuntu18"]
  instance_type = var.instance_type
  key_name      = "dan-devops"
  tags = {
    Name = "maquina_ansible_com_worpress"
  }
  vpc_security_group_ids = [aws_security_group.acesso_geral.id]
}

output "aws_instance_e_ssh" {
  value = [
    aws_instance.maquina_wp.public_ip,
    "ssh -i id_rsa ubuntu@${aws_instance.maquina_wp.public_dns}"
  ]
}

