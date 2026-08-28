variable "vpcname" { # Tipo: String
  type = string
  default = "myvpc"
}

variable "sshport"{ # Tipo: Number
  type = number
  default = 22
}

variable "enabled" { # Tipo: Boolean
  default = true
}

variable "mylist" { # Tipo: List
  type = list(string)
  default = ["Value 1", "Value 2"]
}

variable "mymap" { # Tipo: Map
  type = map
  default = {
    key1 = "value1"
    key2 = "name"
  }
}

variable "inputname" {
  type        = string
  description = "Set the name of the VPC"
}

variable "mytuple" {
  type = tuple([string, number, string])
  default = ["cat", 1, "dog"]
}

variable "myobject" {
  type = object({name = string, port = list(number)})
  default = {
    name = "Jonh Doe"
    port = [22, 80, 110]
  }
}

/*resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.mymap["key2"]
    tags = var.mylist[0]
  }
}*/

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.inputname
  }
}

output "vpcid"{
  value = aws_vpc.myvpc.id
}