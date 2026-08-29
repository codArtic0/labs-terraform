# lab004-eip

## Resource = aws_eip

**O que aprendi:**
- **EIP (Elastic IP):** Para criar um EIP, é obrigatório informar a o ID da instância através dos atributos na seguinte estrutura:

```
resource "aws_eip" "elasticip" {
  instance = aws_instance.ec2.id
}
```