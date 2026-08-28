# lab003-ec2

**O que aprendi:**
- **EC2:** Para montar uma EC2, é preciso de 2 itens obrigatórios: `AMI ID` e Tipo da instância(t3.micro por exemplo)

O resource é `aws_instance` 

```
resource "aws_instance" "ec2" {
  ami = "ami-0332d564d76dbd8d6"
  instance_type = "t3.micro"
}
```
