# lab002-variables

**O que aprendi:**
- **Variables:** Funcionam como variáveis comuns
- **Variable Types:** `string`, `boolean`, `number`

Estrutura esperada:
```
variable "vpcname" {
  type = string
  default = "myvpc"
}
```
> Booleanas não precisam de `type`

**Ainda podemos ter:**
- **Listas(`list()`):** Lista de algum tipo específico (só pode ser de um tipo). Itens são entre **Colchetes**.
Estrutura esperada:
```
variable "mylist" {
  type = list(string)
  default = ["Value 1", "Value 2]
}
```
- **Maps(`map`):** Usa pares chave-valor. Itens são entre **Chaves**.
Estrutura esperada:
```
variable "mymap" {
  type = map
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}
```

- **Tuplas(`tuple([])`):** Quase idêntico a uma lista, mas suporta **diversos tipos de dados**.
Estrutura esperada:
```
variable "mytuple" {
  type = tuple([string, number, string])
  default = ["cat", 1, "dog"]
}
```

- **Objetos(`object({})`):** Semelhante a mapas, mas funcionando como **objeto**.
Estrutura esperada:
```
variable "myobject" {
  type = object({name = string, port = list(number)})
  default = {
    name = "Jonh Doe"
    port = [22, 80, 110]
  }
}
```

O uso de variáveis é feito usando `var.varname`

Podemos fazer ainda **Inputs de variáveis** usando a seguinte estrutura:
```
variable "inputname" {
  type        = string
  description = "Set the name of the VPC"
}
```

Quando executamos o `terraform init` e o `terraform plan`:

![Print do terminal](images/inputname.png)

- **Outputs:** É um tipo de variável que recebe o resultado após a execução do `terraform apply`.

![Print do terminal](images/output.png)
