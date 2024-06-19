variable "amis" {
  type = map(string)
  default = {
    "us-east-1-ubuntu18" = "ami-0c55b159cbfafe1f0"
  }
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}
