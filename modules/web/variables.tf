variable "http_port" {
  type = string
  default = "80"
  description = "HTTP Listening Port"
}

variable "ssh_port" {
  type = string
  default = "22"
  description = "SSH Listening Port"
}

variable "mysql_port" {
  type = string
  default = "3306"
  description = "Mysql Listening Port"
}

variable "tcp_protocol" {
  type = string
  default = "tcp"
  description = "TCP Protocol"
}

variable "all_ip_cidr_block" {
  type = string
  default = "0.0.0.0/0"
  description = "All IP Address CIDR Block"
}

variable "ami" {
  type = string
  default = "ami-0166fe664262f664c"
  description = "Instance AMI Id"
}
variable "vpc_id" {
  type = string
  description = "VPC ID"
}

variable "mysql_server_sg_id" {
  type = string
  description = "Mysql Security Group ID"
}

variable "subnet_id" {
  type = string
  description = "Subnet Id"
}

variable "instance_type" {
  type = string
  description = "Instance Type"
}

variable "security_groups_name" {
  type = string
  description = "Security Group Name"
}

variable "instance_name" {
  type = string
  description = "Instance Name"
}
