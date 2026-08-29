provider "aws" {
  region = "us-east-1"
}

variable "ingressrules" {
  type = list(number)
  default = [80,443]
}
variable "egressrules" {
  type = list(number)
  default = [80,443,25,3306,53,8080]
}

resource "aws_instance" "ec2" {
  ami = "ami-0332d564d76dbd8d6"
  instance_type = "t3.micro"
  security_groups = [aws_security_group.webtraffic.name]
}

resource "aws_security_group" "webtraffic" {
  name = "allow https"
  description = "Allow HTTPS inbound and outbound traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content{
    from_port   = port.value
    to_port     = port.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.ingressrules
    content{
    from_port   = port.value
    to_port     = port.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }
}