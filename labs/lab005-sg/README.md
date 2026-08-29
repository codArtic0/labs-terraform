# lab005-sg

**O que aprendi:**
- **Security Groups:** Para criar um `aws_security_group`, é obrigatório informar um `name` e um `ingress` ou `egress`. Dentro deles, devemos informar um **intervalo de portas** (`from_port`, `to_port`), o `protocol` e os `cidr_blocks` através da seguinte estrutura:

```
resource "aws_security_group" "webtraffic" {
  name = "allow https"
  description = "Allow HTTPS inbound and outbound traffic"

  ingress {
    description = "HTTPS Inbound"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "HTTPS Outbound"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```