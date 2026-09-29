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
  region = "us-east-1"
}

resource "aws_instance" "lab1" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
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