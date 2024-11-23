output "web_instance_id" {
  value = module.web.web_instance_id
}

output "database_instance_id" {
  value = module.database.database_instance_id
}

output "vpc_id" {
  value = module.netowrk.vpc_id
}

output "sg-web" {
  value = module.web.security_group_id
}

output "sg-database" {
  value = module.database.security_group_id
}