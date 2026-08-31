provider "aws" {
  region = "us-east-1"
}

variable "ingressports" {
  type = list(number)
  default = [ 80,443 ]
}
variable "egressports" {
  type = list(number)
  default = [ 80,443 ]
}

resource "aws_security_group" "sg_db" {
  name = "Allow DB"
  description = "Allow DB inbounds and outbounds"
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}

resource "aws_security_group" "sg_web" {
  name = "Allow Web"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingressports
    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressports
    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_instance" "dbserver" {
  ami = "ami-0332d564d76dbd8d6"
  instance_type = "t3.micro"
  tags = {
    Name = "dbserver"
  }
  security_groups = [aws_security_group.sg_db.name]
}

resource "aws_instance" "webserver" {
  ami = "ami-0332d564d76dbd8d6"
  instance_type = "t3.micro"
  tags = {
    Name = "webserver"
  }
  security_groups = [aws_security_group.sg_web.name]
  user_data = file("${path.module}/scripts/server-script.sh")
  user_data_replace_on_change = true 
}

resource "aws_eip" "elasticip" {
  instance = aws_instance.webserver.id
}

output "privateip" {
  value = aws_instance.dbserver.private_ip
}