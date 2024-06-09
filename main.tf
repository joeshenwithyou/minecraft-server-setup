variable "your_ip" {
  description = "IP allowed to SSH into the server."
  type        = string
}

variable "your_public_key" {
  description = "SSH public key for accessing the server."
  type        = string
}

variable "your_region" {
  description = "AWS region to deploy resources."
  type        = string
}

output "instance_public_ip" {
  value = aws_instance.minecraft.public_ip
}

provider "aws" {
  region = var.your_region
}

resource "aws_key_pair" "home" {
  key_name   = "Home"
  public_key = var.your_public_key
}

resource "aws_security_group" "minecraft" {
  name        = "Minecraft"
  description = "Managed by Terraform"

  ingress {
    description = "Allow Minecraft"
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.your_ip}/32"]
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

resource "aws_instance" "minecraft" {
  ami                    = "ami-0cf2b4e024cdb6960"
  instance_type          = "t2.medium"
  key_name               = aws_key_pair.home.key_name
  vpc_security_group_ids = [aws_security_group.minecraft.id]

  tags = {
    Name = "Minecraft"
  }
}

output "instance_ip_addr" {
  value = aws_instance.minecraft.public_ip
}

output "instance_id" {
  value = aws_instance.minecraft.id
}
