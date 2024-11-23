module "netowrk" {
  source = "./modules/network"

  ### VPC Attritubes ###
  vpc_name = var.vpc_name
  vpc_cidr_block = var.vpc_cidr_block

  ### Public Subnet Attritubes ###
  public_subnet_name = var.public_subnet_name
  public_subnet_cidr_block = var.public_subnet_cidr_block
  internet_gateway_name = var.internet_gateway_name

  ### Private Subnet Attritubes ###
  private_subnet_name = var.private_subnet_name
  private_subnet_cidr_block = var.private_subnet_cidr_block
  nat_gateway_name = var.internet_gateway_name

  public_route_table_name = var.public_route_table_name
  private_route_table_name = var.private_route_table_name
}

module "database" {
  source = "./modules/database"

  instance_name = "Mysql-Server"
  subnet_id = module.netowrk.public_subnet_id
  instance_type = "t2.micro"
  security_groups_name = "Mysql-Serbver-SG"
  vpc_id = module.netowrk.vpc_id
  web_server_sg_id = module.web.security_group_id
}

module "web" {
  source = "./modules/web"
  
  instance_name = "Web-Server"
  subnet_id = module.netowrk.public_subnet_id
  instance_type = "t2.micro"
  security_groups_name = "Web-Serbver-SG"
  vpc_id = module.netowrk.vpc_id
  mysql_server_sg_id = module.database.security_group_id

}
