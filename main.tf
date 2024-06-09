terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

variable "your_region" {
  type        = string
  description = "AWS region to deploy resources."
}

variable "your_ip" {
  type        = string
  description = "IP allowed to SSH into the server."
}

variable "your_public_key" {
  type        = string
  description = "SSH public key for accessing the server."
}

provider "aws" {
  region = var.your_region
}

resource "aws_security_group" "minecraft" {
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.your_ip}/32"]
  }
  ingress {
    description = "Allow Minecraft"
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Minecraft"
  }
}

resource "aws_key_pair" "home" {
  key_name   = "Home"
  public_key = var.your_public_key
}

resource "aws_instance" "minecraft" {
  ami                         = "ami-0fdbd8587b1cf431e"
  instance_type               = "t2.medium"
  vpc_security_group_ids      = [aws_security_group.minecraft.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.home.key_name

  tags = {
    Name = "Minecraft"
  }
}

output "instance_ip_addr" {
  value = aws_instance.minecraft.public_ip
}
