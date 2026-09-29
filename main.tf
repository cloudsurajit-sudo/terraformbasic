terraform {
  required_version = ">=1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

data "aws_vpc" "default" {
  default = true
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = data.aws_vpc.default.id
}

resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = data.aws_security_group.default.id
}

resource "aws_instance" "lab1" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = var.instance_type
  tags = {
    Name = "lab1-instance"
  }
}

output "instance_id" {
  value = aws_instance.lab1.id
}

output "instance_public_ip" {
  value = aws_instance.lab1.public_ip
}