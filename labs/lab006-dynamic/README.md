# lab006-dynamic

**O que aprendi:**
- **Dynamic Blocks:** O dynamic block serve para gerar **blocos repetidos dinamicamente** (como vários blocos de ingress ou egress) com base em uma lista, mapa ou variável, evitando que você precise copiar e colar o mesmo código várias vezes

```
dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content{
    from_port   = port.value
    to_port     = port.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  } # Funciona da mesma forma com "egress"
```