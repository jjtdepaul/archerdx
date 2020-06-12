output "app" {
  value = {
    for instance in aws_instance.app:
    instance.id => instance.public_ip
  }
}

output "jenkins" {
  value = aws_instance.jenkins.public_ip
}
