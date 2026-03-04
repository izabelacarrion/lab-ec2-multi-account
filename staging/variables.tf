variable "ambiente" {
  default = "stg" # Recurso alocado para ambiente de Staging
}

variable "bloco_ips_liberados" {
  type        = string
  description = "Define os endereços de IP liberados"
}

variable "chave_ssh" {
  description = "Nome da chave SSH que será passada para o módulo"
  type        = string
}

variable "ssm_instance_profile_name" {
  type = string
}