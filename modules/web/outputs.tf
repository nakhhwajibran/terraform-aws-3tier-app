output "security_group_id" {
  value = aws_security_group.web_server_sg.id
}

output "web_instance_id" {
  value = aws_instance.web_server.id
}