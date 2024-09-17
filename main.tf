module "vpc" {
  source = "./module-vpc"

  for_each   = var.vpc
  cidr_block = each.value["cidr_block"]
  subnets    = each.value["subnets"]

  tags             = local.tags
  env              = var.env
  default_vpc_id   = var.default_vpc_id
  default_vpc_cidr = var.default_vpc_cidr
  default_vpc_rtid = var.default_vpc_rtid
}


module "eks" {
  source             = "./module-eks"
  ENV                = var.env
  eks_version        = 1.27
  PRIVATE_SUBNET_IDS = lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnets", null), "private", null), "subnet_ids", null)
  PUBLIC_SUBNET_IDS  = lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnets", null), "public", null), "subnet_ids", null)
  DESIRED_SIZE       = 2
  MAX_SIZE           = 2
  MIN_SIZE           = 2
  kms_arn            = var.kms_arn
}

