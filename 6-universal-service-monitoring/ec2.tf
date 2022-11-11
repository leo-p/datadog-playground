terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Creator = var.creator
      Team    = var.team
      Project = var.project
    }
  }
}

data "aws_ami" "ec2_ami" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-*"]
  }
}

resource "aws_instance" "ec2-instance" {
  ami             = data.aws_ami.ec2_ami.id
  instance_type   = "t3.large"
  subnet_id       = "subnet-b89e00e2"
  security_groups = ["sg-0348948a9f025a14e"]
  key_name        = "cake-sandbox"
  tags            = { Name = var.project }
  root_block_device { volume_size = 30 }

  connection {
    type  = "ssh"
    user  = "ubuntu"
    host  = self.private_ip
    agent = true
  }
}

output "ssh_ec2" {
  value = "ssh_sand ubuntu@${aws_instance.ec2-instance.private_ip}"
}
