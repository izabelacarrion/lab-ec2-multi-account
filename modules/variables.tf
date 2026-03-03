variable "nomes_vpc" {
  type = map(string)
  default = {
    "stg"  = "VPC-stg"
    "prod" = "VPC-prod"
  }
}

variable "ambiente" {
  type        = string
  description = "Ambiente do recurso prod ou stg"
}

variable "portas_web" {
  type    = list(number)
  default = [8080, 80]
}

variable "portas_db" {
  type    = list(number)
  default = [3306, 22]
}

variable "bloco_ips_liberados" {
  type        = string
  description = "Define os endereços de IP liberados"
}

variable "chave_ssh" {
  type        = string
  description = "Chave SSH de acesso ao ambiente"
}