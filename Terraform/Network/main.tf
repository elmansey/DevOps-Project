module VPC {
  source = "./VPC"
  vpc_cider = var.vpc_cider
}

module Subnets {
  source = "./Subnets"
  vpc_id=module.VPC.vpc_id
  subnet_cidr_block_one=var.subnet_cidr_block_one
  subnet_cidr_block_two=var.subnet_cidr_block_two
  subnet_cidr_block_three=var.subnet_cidr_block_three
  subnet_cidr_block_four=var.subnet_cidr_block_four
  availability_zone_one=var.availability_zone_one
  availability_zone_two=var.availability_zone_two
}


module InternetGateway {
  source = "./InternetGateway"
  vpc_id=module.VPC.vpc_id
}


module NatGateways {
  source = "./NatGateways"
  public_subnet_one_id = module.Subnets.public_subnet_one_id
  igw_id = module.InternetGateway.igw_id
}

module RouteTables {
  source="./RouteTables"
  vpc_id = module.VPC.vpc_id
  ngw_id = module.NatGateways.ngw_id
  igw_id = module.InternetGateway.igw_id
  public_subnet_one_id = module.Subnets.public_subnet_one_id
  public_subnet_two_id = module.Subnets.public_subnet_two_id
  private_subnet_one_id = module.Subnets.private_subnet_one_id
  private_subnet_two_id = module.Subnets.private_subnet_two_id
}


module SecurityGroups {
  source="./SecurityGroups"
  vpc_id =  module.VPC.vpc_id
}