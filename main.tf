provider "aws" {
  region = "us-east-1"
}

module "networking" {
  source   = "git@github.com:javahometech/terraform-modules-ugam//networking?ref=master"
  app_name = "eks-ugam"
}

module "eks" {
  source = "./modules/eks"
  subnet_ids = slice(module.networking.pub_sub_ids,0,4)
  app_name = "eks-ugam"
  vpc_id=module.networking.vpc_id
}