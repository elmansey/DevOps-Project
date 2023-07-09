module Network {
  source = "./Network"
  vpc_cider = var.vpc_cider
  subnet_cidr_block_two = var.subnet_cidr_block_two
  subnet_cidr_block_one = var.subnet_cidr_block_one
  subnet_cidr_block_three = var.subnet_cidr_block_three
  subnet_cidr_block_four = var.subnet_cidr_block_four
  availability_zone_one = var.availability_zone_one
  availability_zone_two = var.availability_zone_two
}


module DataSource {
  source = "./DataSource"
}

module EC2s {
  source = "./EC2s"
  ubuntu_ami = module.DataSource.ubuntu_ami
  instance_type = var.instance_type
  jenkins_sg = module.Network.jenkins_sg_id
  public_subnet_one = module.Network.public_subnet_one_id
  public_subnet_two = module.Network.public_subnet_two_id
  nexus_sg = module.Network.nexus_sg_id
  allow_ssh = module.Network.allow_ssh_sg_id
  sonerqube_sg = module.Network.sonerqube_sg_id
  availability_zone_one = var.availability_zone_one
  availability_zone_two = var.availability_zone_two
}