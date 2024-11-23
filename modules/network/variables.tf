## VPC  - Variables ##

variable "vpc_instance_tenancy" {
  type = string
  description = "VPC Instance Tenancy"
  default = "default"
}

variable "vpc_cidr_block" {
  type = string
  description = "VPC CIDR Block"
}

variable "vpc_name" {
  type = string
  description = "VPC Main"
}

###  Private Subnet - Variables ### 

variable "private_subnet_cidr_block" {
  type = string
  description = "Private Subnet CIDR Block"
}

variable "private_subnet_name" {
  type = string 
  description = "Private Subnet Name"
}

variable "nat_gateway_name" {
  type = string
  description = "Nat Gateway Name"
}

variable "all_ip_cidr_block" {
  type = string
  default = "0.0.0.0/0"
  description = "All IP Address CIDR Block"
}

###  Public Subnet - Variables ### 

variable "public_subnet_cidr_block" {
  type = string
  description = "Public Subnet CIDR Block"
}

variable "public_subnet_name" {
  type = string 
  description = "Public Subnet Name"
}

variable "internet_gateway_name" {
  type = string
  description = "Internet Gateway Name"
}

variable "public_route_table_name" {
  type = string
  description = "Public Route Table Name"
}

variable "private_route_table_name" {
  type = string
  description = "Private Route Table Name"
}