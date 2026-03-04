output "instance_ip_web_addr" {
  value       = aws_instance.srv_web.private_ip
  description = "IP privado da instancia WEB"
}

output "instance_public_web_addr" {
  value       = aws_instance.srv_web.public_ip
  description = "IP Publico da instancia WEB"

}

output "instance_ip_db_addr" {
  value       = aws_instance.srv_db.private_ip
  description = "IP privado da instancia DB"
}

output "sg_id" {
  value       = aws_security_group.sg_web.id # O recurso de SG que você criou no módulo
  description = "ID do Security Group para liberar o SSH"
}

output "instance_id_web" {
  description = "ID da instancia Web para o Ansible via SSM"
  value       = aws_instance.srv_web.id
}

output "instance_id_db" {
  description = "ID da instancia DB para o Ansible via SSM"
  value       = aws_instance.srv_db.id
}