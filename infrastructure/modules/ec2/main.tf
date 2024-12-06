resource "aws_instance" "instance1" {
  ami             = "ami-0058f736afded77b3"
  instance_type   = "t2.micro"
  subnet_id       = var.subnet1_id
  key_name        = var.ssh_key_name
  security_groups = [var.pubic_security_group.id]
  tags = {
    Name = "w01"
    Project = "project_lab13"
    Server_Role = "web"
  }
  user_data = <<-EOF
              #!/bin/bash
              hostnamectl set-hostname i1
              EOF
}

resource "aws_instance" "instance2" {
  ami             = "ami-0058f736afded77b3"
  instance_type   = "t2.micro"
  subnet_id       = var.subnet2_id
  security_groups = [var.private_security_group.id]
  key_name        = var.ssh_key_name
  tags = {
    Name = "b01"
    Project = "project_lab13"
    Server_Role = "backend"
  }

  user_data = <<-EOF
              #!/bin/bash
              hostnamectl set-hostname i2
              EOF

}

