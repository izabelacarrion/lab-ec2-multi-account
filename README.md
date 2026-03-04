# 🚀 Lab EC2 Multi-Account

Este projeto implementa uma arquitetura de nuvem escalável e segura utilizando o modelo de segregação de contas (Staging e Production) e automação completa via CI/CD com GitHub Actions.

O grande diferencial desta implementação é o gerenciamento das instâncias via AWS Systems Manager (SSM), eliminando a necessidade de exposição de portas SSH (22) e o uso de chaves privadas .pem no ambiente.

Este projeto se conecta diretamente com a estrutura do projeto [lab-aws-multi-account](https://github.com/izabelacarrion/lab-aws-multi-account "Ir para o GitHub") que é responsável pela fundação da infraestrutura (VPC, sub-redes, roteamento e segmentação de rede). Enquanto o lab-aws-multi-account constrói a base de rede e governança, este projeto realiza o provisionamento das instâncias EC2 sobre essa estrutura previamente criada, simulando um cenário real onde a camada de rede e a camada de aplicações são gerenciadas de forma desacoplada e modular.
---

## 📌 Objetivo

Este laboratório foi criado com foco em:

- Provisionar instâncias EC2 em múltiplas contas AWS
- Separar ambientes (ex: staging e production)
- Aplicar boas práticas de organização com módulos Terraform
- Automatizar o deploy com GitHub Actions
- Configurar servidores automaticamente com Ansible

O projeto simula um cenário real de ambiente corporativo com separação de contas e responsabilidades.

---

## 🏗️ Arquitetura do Projeto

A infraestrutura é organizada para garantir isolamento total e segurança entre os ambientes:

Provedor de Identidade (OIDC): Conexão segura entre GitHub Actions e AWS sem a necessidade de chaves de acesso fixas (Access Keys).
Segregação Multi-Account: Ambientes de Staging e Production isolados em contas AWS distintas.
Camada de Rede (VPC): Implementação de subnets públicas para balanceadores e camadas web, e subnets privadas para o banco de dados.
Provisionamento (Terraform): Infraestrutura como Código (IaC) modularizada para criação de instâncias EC2, Security Groups e Roles IAM.
Configuração (Ansible via SSM): Gerenciamento de configuração (Nginx e DB) utilizando o transporte seguro do AWS SSM em vez do SSH tradicional.

---

## 📁 Estrutura do Repositório

```text
.
├── .github/workflows/  # Pipelines CI/CD (GitHub Actions)
├── modules/            # Módulos reutilizáveis do Terraform (ex: vpc, ec2, rds)
├── staging/            # Configuração e estado do ambiente de Staging/Homologação
├── production/         # Configuração e estado do ambiente de Produção
├── playbook.yml        # Playbook Ansible para configuração de instâncias
└── README.md           # Documentação técnica do projeto
```
---

🛰️ Gestão via AWS SSM (Zero Trust):

O acesso às instâncias é realizado exclusivamente via AWS Systems Manager (SSM).
Sem SSH: Porta 22 fechada e eliminação total de chaves privadas .pem.
Acesso Privado: Gerenciamento de instâncias em subnets privadas sem necessidade de IPs públicos ou Bastion Hosts.
Ansible over SSM: Automação configurada para usar o túnel do SSM como transporte.

🔒 Segregação e Identidade:

Multi-Account: Ambientes isolados em contas AWS distintas para prevenir a propagação de falhas.
OIDC: Autenticação do GitHub Actions via OpenID Connect, eliminando credenciais estáticas no repositório.

📈 Observabilidade com CloudWatch:

Logs de Execução: Histórico completo de comandos do Ansible registrados no CloudWatch Logs.
Alertas de Saúde: Monitoramento do status do agente SSM e métricas de hardware.
Notificações: Alertas configurados para notificar falhas críticas de infraestrutura em tempo real.

© 2026 - Desenvolvido por Izabela Carrion para fins de estudo em Cloud & DevOps.
