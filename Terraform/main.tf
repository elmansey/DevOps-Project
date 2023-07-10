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
  nexus_instance_type = var.nexus_instance_type
  jenkins_sg = module.Network.jenkins_sg_id
  public_subnet_one = module.Network.public_subnet_one_id
  public_subnet_two = module.Network.public_subnet_two_id
  nexus_sg = module.Network.nexus_sg_id
  allow_ssh = module.Network.allow_ssh_sg_id
  sonerqube_sg = module.Network.sonerqube_sg_id
  availability_zone_one = var.availability_zone_one
  availability_zone_two = var.availability_zone_two
  sonerqube_instance_type=var.sonerqube_instance_type
}

module EKS {
  source="./EKS"
  EksName=var.EksName
  node_group_name=var.node_group_name
  Kubernetes_version=var.Kubernetes_version
  private_subnet_ids=[
    module.Network.private_subnet_one_id,
    module.Network.private_subnet_two_id
  ]
  Eks_cluster_sg_id=module.Network.Eks_cluster_sg_id
  ami_type=var.ami_type
  capacity_type=var.capacity_type
  disk_size=var.disk_size
  instance_types=var.instance_types
  desired_size=var.desired_size
  max_size=var.max_size
  min_size=var.min_size
  max_unavailable=var.max_unavailable
}