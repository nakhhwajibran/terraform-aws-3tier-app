resource "aws_security_group" "web_server_sg" {
  name        = var.security_groups_name
  vpc_id      = var.vpc_id
  description = "Web Security Security Group"
  tags = {
    Name = var.security_groups_name
  }

}

resource "aws_vpc_security_group_ingress_rule" "allow_inbound_http_ipv4" {
  security_group_id = aws_security_group.web_server_sg.id
  from_port         = var.http_port
  to_port           = var.http_port
  ip_protocol       = var.tcp_protocol
  cidr_ipv4         = var.all_ip_cidr_block
}

resource "aws_vpc_security_group_ingress_rule" "allow_inbound_ssh_ipv4" {
  security_group_id = aws_security_group.web_server_sg.id
  from_port         = var.ssh_port
  to_port           = var.ssh_port
  ip_protocol       = var.tcp_protocol
  cidr_ipv4         = var.all_ip_cidr_block
}

resource "aws_vpc_security_group_ingress_rule" "allow_inbound_private_subnet" {
  security_group_id = aws_security_group.web_server_sg.id
  from_port         = var.mysql_port
  to_port           = var.mysql_port
  ip_protocol       = var.tcp_protocol
  referenced_security_group_id = var.mysql_server_sg_id
}

resource "aws_vpc_security_group_egress_rule" "allow_outbound_http_ipv4" {
  from_port         = var.http_port
  to_port           = var.http_port
  ip_protocol       = var.tcp_protocol
  cidr_ipv4         = var.all_ip_cidr_block
  security_group_id = aws_security_group.web_server_sg.id
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.web_server_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = var.all_ip_cidr_block
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.web_server_sg.id
  ip_protocol       = "-1"
  cidr_ipv6         = "::/0"
}

resource "aws_instance" "web_server" {
  subnet_id       = var.subnet_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.web_server_sg.id]
  ami             = var.ami
  key_name        = "newKey"
  tags = {
    Name = var.instance_name
  }
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Welcome to the Web Server" > /var/www/html/index.html
              yum install -y mariadb-server
              systemctl start mariadb
              systemctl enable mariadb
              EOF
}