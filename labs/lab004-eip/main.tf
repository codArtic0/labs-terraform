provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami = "ami-0332d564d76dbd8d6"
  instance_type = "t3.micro"
}

resource "aws_eip" "elasticip" {
  instance = aws_instance.ec2.id
}

output "EIP" {
  value = aws_eip.elasticip.public_ip
}