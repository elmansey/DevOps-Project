module Roles {
  source="./Roles"
}

module Policies {
  source="./Policies"
  AmazonEKSNodeRole_name=module.Roles.AmazonEKSNodeRoleName
  EksClusterRole_name=module.Roles.EksClusterRoleName
}

module NodeGroup {
    source= "./NodeGroup"
    EksName=var.EksName
    node_group_name=var.node_group_name
    AmazonEKSNodeRole_arn=module.Roles.AmazonEKSNodeRole_arn
    private_subnet_ids=var.private_subnet_ids
    ami_type=var.ami_type
    capacity_type=var.capacity_type
    disk_size=var.disk_size
    instance_types=var.instance_types
    desired_size=var.desired_size
    max_size=var.max_size
    min_size=var.min_size
    max_unavailable=var.max_unavailable
    AmazonEKSWorkerNodePolicyAttachment=module.Policies.AmazonEKSWorkerNodePolicyAttachment
    AmazonEC2ContainerRegistryReadOnlyPolicyAttachment=module.Policies.AmazonEC2ContainerRegistryReadOnlyPolicyAttachment
    AmazonEKS_CNI_PolicyAttachment=module.Policies.AmazonEKS_CNI_PolicyAttachment
}

resource "aws_eks_cluster" "EksCluster" {
  name     = var.EksName
  role_arn = module.Roles.EksClusterRole_arn
  version = var.Kubernetes_version
  enabled_cluster_log_types = ["api","authenticator"]
  vpc_config {
    endpoint_private_access = true
    endpoint_public_access = false
    subnet_ids = var.private_subnet_ids
    security_group_ids = [var.Eks_cluster_sg_id]
  }
  depends_on = [module.Policies.EksClusterRolePolicyAttachment ]
}