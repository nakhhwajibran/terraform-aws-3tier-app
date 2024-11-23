resource "aws_security_group" "mysql_server_sg" {
  vpc_id = var.vpc_id
  name = "mysql-server-sg"
  description = "Mysql Server Security Group"
}

resource "aws_vpc_security_group_ingress_rule" "allow_mysql_port_from_web_server_sg" {
  security_group_id = aws_security_group.mysql_server_sg.id  
  from_port = var.mysql_port
  to_port = var.mysql_port
  ip_protocol = var.tcp_protocol
  referenced_security_group_id = var.web_server_sg_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_port_from_web_server_sg" {
  security_group_id = aws_security_group.mysql_server_sg.id  
  from_port = var.ssh_port
  to_port = var.ssh_port
  ip_protocol = var.tcp_protocol
  referenced_security_group_id = var.web_server_sg_id
}

resource "aws_vpc_security_group_egress_rule" "name" {
  security_group_id = aws_security_group.mysql_server_sg.id
  ip_protocol = "-1"
  cidr_ipv4 = var.all_ip_cidr_block
  from_port = 0
  to_port = 0
}

resource "aws_instance" "mysql_server" {
  subnet_id       = var.subnet_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.mysql_server_sg.id]
  ami             = var.ami
  key_name        = "newKey"
  tags = {
    Name = var.instance_name
  }
    user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y mariadb-server
              systemctl start mariadb
              systemctl enable mariadb
              EOF
}