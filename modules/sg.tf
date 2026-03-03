#Cria um Security Group com base no ambiente
resource "aws_security_group" "sg_web" {
  name        = "sg_web"
  description = "SG SRV Web"
  vpc_id      = data.aws_vpc.projeto_vpc.id

  dynamic "ingress" {
    for_each = var.portas_web
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress { # Regra de saída
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "sg_web"
    Environment = var.ambiente
  }
}

resource "aws_security_group" "sg_db" {
  name        = "sg_db"
  description = "SG SRV DB"
  vpc_id      = data.aws_vpc.projeto_vpc.id

  dynamic "ingress" {
    for_each = var.portas_db
    content {
      from_port       = ingress.value
      to_port         = ingress.value
      protocol        = "tcp"
      security_groups = [aws_security_group.sg_web.id]
    }
  }

  egress { # Regra de saída
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Regra para SSH
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_web.id]
  }

  egress { # Regra de saída
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "sg_db"
    Environment = var.ambiente
  }
}

# Cria uma regra de entrada para o meu endereço de IP no servidor web
resource "aws_vpc_security_group_ingress_rule" "lib_meu_ssh" {
  for_each = toset(compact([for ip in split("\n", var.bloco_ips_liberados) : trimspace(ip)]))

  security_group_id = aws_security_group.sg_web.id
  cidr_ipv4         = each.value
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  description       = "Acesso SSH"
}