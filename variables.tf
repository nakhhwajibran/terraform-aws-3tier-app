variable "vpc_cidr_block" {
  type = string
  description = "VPC CIDR Block"
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  type = string
  default = "Main-VPC"
  description = "VPC Name"
}

variable "public_subnet_name" {
  type = string
  default = "Public-Subnet"
  description = "Public Subnet Name"
}

variable "public_subnet_cidr_block" {
  type = string
  default = "10.0.0.0/24"
  description = "Public Subnet CIDR Block"
}

variable "internet_gateway_name" {
  type = string
  default = "public-subnet-igw"
  description = "Public Subnet Internet Gateway"
}

variable "private_subnet_name" {
  type = string
  default = "Private-Subnet"
  description = "Private Subnet Name"
}

variable "private_subnet_cidr_block" {
  type = string
  default = "10.0.1.0/24"
  description = "Private Subnet CIDR Block"
}

variable "nat_gateway_name" {
  type = string
  default = "public-subnet-ngw"
  description = "Public Subnet Nat Gateway"
}

variable "public_route_table_name" {
  type = string
  description = "Public Route Table Name"
  default = "Public-Route-Table"
}

variable "private_route_table_name" {
  type = string
  description = "Private Route Table Name"
  default = "Private-Route-Table"
}
