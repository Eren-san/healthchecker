provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] 
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  key_name = var.key_name
  security_groups = [aws_security_group.healthchecker_sg.name]

  tags = {
    Name = "healthchecker"
  }
}

output "public_ip" {
  value = aws_instance.app_server.public_ip
}


