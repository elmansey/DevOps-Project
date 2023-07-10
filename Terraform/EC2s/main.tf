module KeyPairs {
  source = "./KeyPairs"
}

resource "aws_instance" "jenkins_ec2" {
  ami           = var.ubuntu_ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.jenkins_sg,var.allow_ssh]
  subnet_id = var.public_subnet_two
  key_name = module.KeyPairs.key_pair_id
  availability_zone=var.availability_zone_two
  tags = {
    Name = "jenkins_ec2"
  }
}

resource "aws_instance" "nexus_ec2" {
  ami           = var.ubuntu_ami
  instance_type = var.nexus_instance_type
  vpc_security_group_ids = [var.nexus_sg,var.allow_ssh]
  subnet_id = var.public_subnet_two
  key_name = module.KeyPairs.key_pair_id
  availability_zone=var.availability_zone_two
  tags = {
    Name = "nexus_ec2"
  }
}

resource "aws_instance" "sonerqube_ec2" {
  ami           = var.ubuntu_ami
  instance_type = var.sonerqube_instance_type
  vpc_security_group_ids = [var.sonerqube_sg,var.allow_ssh]
  subnet_id = var.public_subnet_one
  key_name = module.KeyPairs.key_pair_id
  availability_zone=var.availability_zone_one
  tags = {
    Name = "sonerqube_ec2"
  }
}

