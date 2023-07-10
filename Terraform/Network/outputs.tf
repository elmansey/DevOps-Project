output public_subnet_one_id  {value=module.Subnets.public_subnet_one_id}
output public_subnet_two_id  {value=module.Subnets.public_subnet_two_id}
output private_subnet_one_id {value=module.Subnets.private_subnet_one_id}
output private_subnet_two_id {value=module.Subnets.private_subnet_two_id}
output vpc_id {value = module.VPC.vpc_id }
output vpc_cidr_block {value = module.VPC.vpc_cidr_block }
output ngw_id  {value=module.NatGateways.ngw_id}
output igw_id  {value=module.InternetGateway.igw_id}
output allow_ssh_sg_id {value= module.SecurityGroups.allow_ssh_sg_id}
output jenkins_sg_id {value= module.SecurityGroups.jenkins_sg_id}
output nexus_sg_id {value= module.SecurityGroups.nexus_sg_id}
output sonerqube_sg_id {value= module.SecurityGroups.sonerqube_sg_id}
output Eks_cluster_sg_id {value= module.SecurityGroups.Eks_cluster_sg}
