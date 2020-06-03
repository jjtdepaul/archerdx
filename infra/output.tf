output "nginx" {
  value = {
    for instance in aws_instance.nginx:
    instance.id => instance.public_ip
  }
}
