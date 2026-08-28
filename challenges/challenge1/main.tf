variable "namevpc" {
  type = string
  default = "vpc1"
}

resource "aws_vpc" "challengevpc" {
  cidr_block = "192.168.0.0/24"
  tags = {
    Name = var.namevpc
  }
}