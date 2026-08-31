variable "ec2name" {
  type = string
}

resource "aws_instance" "ec2" {
  ami = "ami-0332d564d76dbd8d6"
  instance_type = "t3.micro"
  tags = {
    Name = var.ec2name
  }
}