provider "aws" {
  region = "us-west-1"
}

terraform {
  backend "local" {
    path = "staging/ecr/terraform.tfstate"
  }
}

module "ecr" {
  source    = "../../../modules/ecr"
  repo_name = "flask-app"
}