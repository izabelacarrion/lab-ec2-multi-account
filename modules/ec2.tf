# Criando EC2 para serviço web
resource "aws_instance" "srv_web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  # Adiciona VPC correta
  subnet_id = data.aws_subnet.publica.id

  # Adiciona SG
  vpc_security_group_ids = [aws_security_group.sg_web.id]

  # Adiciona Chave SSH
  key_name = var.chave_ssh

  # Criando nome do volume e tamanho do volume
  root_block_device {
    volume_size = 8
  }

  tags = {
    Name        = "srv_web-${var.ambiente}"
    Plataforma  = data.aws_ami.amazon_linux.platform_details
    Environment = var.ambiente
  }

}

# Criando EC2 para banco de dados
resource "aws_instance" "srv_db" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  # Adiciona VPC correta
  subnet_id = data.aws_subnet.privada.id

  # Adiciona SG
  vpc_security_group_ids = [aws_security_group.sg_db.id]

  # Adiciona Chave SSH
  key_name = var.chave_ssh

  # Criando nome do volume e tamanho do volume
  root_block_device {
    volume_size = 8
  }

  tags = {
    Name        = "srv_db-${var.ambiente}"
    Plataforma  = data.aws_ami.amazon_linux.platform_details
    Environment = var.ambiente
  }

}