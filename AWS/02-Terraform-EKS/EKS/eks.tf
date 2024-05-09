module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.17.2"

  cluster_name    = "${var.cluster_name}"
  cluster_version = var.cluster_version

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = false

  vpc_id     = "vpc-02798590029133ee9"
  subnet_ids = ["subnet-0303f947a022fb36d", "subnet-07a05008d1566f4d2"]

  eks_managed_node_groups = {
    default = {
      min_size       = 1
      max_size       = var.instance_count
      desired_size   = var.instance_count
      instance_types = [var.instance_type]
#      ami_id = data.aws_ami.ami_image.id
    }
  }
}
