output "nginx1" {
  value = aws_instance.nginx[0].public_ip
}

output "nginx2" {
  value = aws_instance.nginx[1].public_ip
}

