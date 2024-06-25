variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "amis" {
  description = "A map of AWS AMIs per region"
  type        = map(string)
  default = {
    "us-east-1" = "ami-0e001c9271cf7f3b9"
  }
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key name"
  type        = string
  default     = "dan-devops"
}
