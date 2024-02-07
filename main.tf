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
              echo "<html>
                    <body>
                    <h1>ABD</h1>
                    <img src="https://w0.peakpx.com/wallpaper/24/37/HD-wallpaper-ab-de-villiers-abd-escn-mr360-rcb-superman.jpg" width="400" height="600">
                    </body>
                    </html>" > /var/www/html/index.html
              EOF
}
