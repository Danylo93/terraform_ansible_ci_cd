variable "region" {
  default = "us-east-1"
}

variable "amis" {
  type = map(string)
  default = {
    "us-east-1-ubuntu18" = "ami-0c55b159cbfafe1f0"  # Exemplo de AMI, substitua conforme necessário
  }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "dan-devops"
}
