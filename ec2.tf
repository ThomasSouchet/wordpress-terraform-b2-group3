data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "deploy" {
  key_name   = "b2-group3"
  public_key = tls_private_key.b2group3.public_key_openssh
}

resource "tls_private_key" "b2group3" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "pem_file" {
  filename          = "./b2group3key.pem"
  file_permission   = "600"
  sensitive_content = tls_private_key.b2group3.private_key_pem
}

resource "aws_instance" "main" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_a.id
  vpc_security_group_ids = [aws_security_group.ec2.id]
  key_name               = aws_key_pair.deploy.key_name

  iam_instance_profile = aws_iam_instance_profile.b2-group3.name

  user_data = file("configure_ec2.sh")
  tags = {
    Name = "ec2_b2-group3"
  }
}
