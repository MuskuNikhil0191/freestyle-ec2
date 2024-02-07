terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "demo-ec2" {
  ami                         = "ami-0866a04d72a1f5479"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  tags = {
    "Name" = "webhook-ec2"
  }
  user_data = <<-EOF
              #!/bin/bash
              # Use this for your user data (script from top to bottom)
              # install httpd (Linux 2 version)
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello from web hook ec2!" > /var/www/html/index.html
              EOF
}
