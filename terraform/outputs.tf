output "backend_instance_ip" {
  value = aws_instance.backend.public_ip
}

output "frontend_instance_ip" {
  value = aws_instance.frontend.public_ip
}
