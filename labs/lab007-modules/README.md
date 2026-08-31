# lab007-modules

**O que aprendi:**
- **O que são Modules:** É uma pasta com código dentro dela para que o código fique reutilizável.

- **Criamos o componente do module** em uma pasta dentro da pasta raiz do projeto, para termos o `source` e criamos `variables` para que possamos editar de fora do modulecomo um objeto em POO.

Estrutura de diretórios:

```text
lab007-module/
├── .terraform/
├── ec2/
│   ├── ec2.tf
├── .terraform.lock.hcl
├── main.tf
├── terraform.tfstate
└── terraform.tfstate.backup
```

- No projeto principal, usamos os modules assim:
```
module "ec2" {
  source = "./ec2"
  ec2name = "modulename"
}
```

- Caso queira usar um módulo em outro, é preciso configurar uma saída (`output`) dentro do módulo, e outra na `main` onde o módulo é instanciado.

No `ec2.tf`:

```
output "instanceid" {
  value = aws_instance.ec2.id
}
```

Na `main.tf`:

```
output "moduleoutput" {
  value = module.ec2.instanceid
}
```

- Conseguimos pegar módulos a partir do **Terraform Registry**