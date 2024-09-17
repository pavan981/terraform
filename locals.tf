locals {
  vpc_id = lookup(lookup(module.vpc, "main", null), "vpc_id", null)
  tags = {
    business_unit = "xxxxxxxxxxxx"
    business_type = "xxxxxxxxxx"
    project       = "xxxxxxxxxxx"
    cost_center   = 100
    env           = var.env
  }
}

