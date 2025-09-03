provider "aws" {
  region = "us-west-1"
}

terraform {
  backend "local" {
    path = "staging/vpc/terraform.tfstate"
  }
}

module "vpc" {
  source             = "../../../modules/vpc"
  env                = "staging"
  availability_zones = ["us-west-1a", "us-west-1c"]
  private_subnets    = ["10.0.0.0/19", "10.0.32.0/19"]
  public_subnets     = ["10.0.64.0/19", "10.0.96.0/19"]
  container_image   = "605941532895.dkr.ecr.us-west-1.amazonaws.com/flask-app-ecr-repository:2f7b8ee"

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/staging"   = "owned"
  }

  public_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/staging"   = "owned"
  }
}