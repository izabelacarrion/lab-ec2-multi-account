output "ip_privado_web" {
  value       = module.ec2-production.instance_ip_web_addr
  description = "IP privado da instancia WEB"
}

output "ip_publico_web" {
  value       = module.ec2-production.instance_public_web_addr
  description = "IP Publico da instancia WEB"
}

output "ip_privado_db" {
  value       = module.ec2-production.instance_ip_db_addr
  description = "IP privado da instancia DB"
}

output "security_group_id_web" {
  value       = module.ec2-production.sg_id
  description = "ID do Security Group que o GitHub Actions vai manipular"
}

output "instance_id_web" {
  description = "ID da instancia Web para o Ansible via SSM"
  value       = module.ec2-production.instance_id_web
}

output "instance_id_db" {
  description = "ID da instancia DB para o Ansible via SSM"
  value       = module.ec2-production.instance_id_db
}