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