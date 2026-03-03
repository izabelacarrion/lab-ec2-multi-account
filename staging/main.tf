module "ec2-staging" {
  source              = "../modules"
  ambiente            = var.ambiente
  bloco_ips_liberados = var.bloco_ips_liberados
  chave_ssh           = var.chave_ssh
}