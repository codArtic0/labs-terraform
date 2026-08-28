# lab001-first-resource-vpc

**O que aprendi:**
- **Provider:** Onde o projeto será hospedado (aws por exemplo)
- **Resource:** O recurso que estou utilizando (aws_vpc)
```
resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
}
```

> `aws_vpc` é o meu **Resource.** `name` é o **Nome interno** que o terraform usa.

*Revisão de CIDR Block: é um grupo de endereços IP que compartilham um prefixo de rede comum e um tamanho de máscara de rede especificado por um sufixo numérico*

*Notação: 10.0.0.0/16 oferece o IP **10.0.0.0** e o **/16** informa quantos bits iniciais tem o prefixo da rede. Subtrai 32 bits dos identificadores (32-16 = 16) e faz 2^16 = 65.536. Na AWS, Com o endereço da rede **10.0.0.0**, VPC Router **10.0.0.1**, DNS **10.0.0.2**, Reservado para o futuro **10.0.0.3** e Broadcast **10.0.0.255**, restam 65.531. No geral, se reservam 2: Network **10.0.0.0** e Broadcast **10.0.0.255***

- `terraform init`: Baixa os provedores (AWS, Azure, GCP...), configura o backend (Prepara o local onde o arquivo de estado (terraform.tfstate) será armazenado (local ou remoto)), baixa os módulos externos e cria arquivos de controle (como .terraform, terraform.lock.hcl...)

- `terraform apply`: serve para criar, atualizar ou excluir recursos de infraestrutura na nuvem para que eles fiquem idênticos ao estado desejado descrito no seu código.

- `terraform destroy`: serve para remover e desligar todos os recursos de infraestrutura que estão sendo gerenciados por um arquivo de estado (state file) do Terraform.