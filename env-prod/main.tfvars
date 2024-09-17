env              = "prod"
monitor_cidr     = "xxxxxxxx"
bastion_cidr     = "xxxxxxxxxx"
default_vpc_id   = "xxxxxxxxxxxx"
default_vpc_cidr = "xxxxxxxxxxx"
default_vpc_rtid = "xxxxxxxxxxx"
kms_arn          = "xxxxxxxxxxxxxxxxxxxx"
domain_name      = "xxxxxxx"
domain_id        = "xxxxxxxxxxx"


vpc = {
  main = {
    cidr_block = "10.100.0.0/16"
    subnets = {
      public = {
        name       = "public"
        cidr_block = ["10.100.0.0/24", "10.100.1.0/24"]
        azs        = ["us-east-1a", "us-east-1b"]
      }
       private= {
        name       = "private"
        cidr_block = ["10.100.2.0/24", "10.100.3.0/24"]
        azs        = ["us-east-1a", "us-east-1b"]
      }
    }
  }
}
