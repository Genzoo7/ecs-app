# we use name "this" to avoid name conflicts 
# when using this module multiple times
# in the same terraform project
# or if resource module creates only one resource of this type
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cicr_block

  # efs drives require dns support
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.env}-main-vpc"
  }
}