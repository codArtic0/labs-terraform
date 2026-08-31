variable "instance" {
  type = string
}

resource "aws_eip" "eip" {
  instance = var.instance
}