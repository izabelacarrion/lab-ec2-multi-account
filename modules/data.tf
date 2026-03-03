# Bloco AMI
data "aws_ami" "amazon_linux" {
  most_recent = true       # Procura versao mais recente
  owners      = ["amazon"] # Qual é o dono dessa imagem, ID da Amazon


  filter {
    name   = "name" # Nome da AMI
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type" # Tipo de virtualizacao
    values = ["hvm"]
  }

}

# Busca a VPC pelo nome
data "aws_vpc" "projeto_vpc" {
  filter {
    name   = "tag:Name"
    values = [lookup(var.nomes_vpc, var.ambiente)] # O nome definido no outro repositório
  }
}

# Busca a subnet pública para o Web Server
data "aws_subnet" "publica" {
  filter {
    name   = "tag:Name"
    values = ["Subnet-pub-${var.ambiente}"]
  }
}

# Busca a subnet privada para o SRV de Banco
data "aws_subnet" "privada" {
  filter {
    name   = "tag:Name"
    values = ["Subnet-priv-${var.ambiente}"]
  }
}

# Busca o SNS criado na AWS
data "aws_sns_topic" "alerta_disponivel" {
  name = "SNS01" # Nome do tópico
}