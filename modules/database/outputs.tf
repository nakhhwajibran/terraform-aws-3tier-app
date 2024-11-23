output "security_group_id" {
  value = aws_security_group.mysql_server_sg.id
}

output "database_instance_id" {
  value = aws_instance.mysql_server.id
}