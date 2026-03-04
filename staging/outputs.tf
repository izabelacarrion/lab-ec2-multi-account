output "ip_privado_web" {
  value       = module.ec2-staging.instance_ip_web_addr
  description = "IP privado da instancia WEB"
}

output "ip_publico_web" {
  value       = module.ec2-staging.instance_public_web_addr
  description = "IP Publico da instancia WEB"
}

output "ip_privado_db" {
  value       = module.ec2-staging.instance_ip_db_addr
  description = "IP privado da instancia DB"
}

output "security_group_id_web" {
  value       = module.ec2-staging.sg_id # Puxa o ID do SG de dentro do módulo
  description = "ID do Security Group que o GitHub Actions vai manipular"
}