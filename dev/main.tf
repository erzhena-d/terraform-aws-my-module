// Configure the AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

// Call the VPC module to create a VPC and subnets
module "vpc" {
  source = "../vpc"

  environment = var.environment
  vpc_cidr    = var.vpc_cidr
  subnets     = var.subnets
}

// Call the EC2 module to create an EC2 instance in each subnet

module "ec2_web1" {
  source             = "../ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  environment        = var.environment
  subnet_id          = module.vpc.subnet1_id
  security_group_ids = module.vpc.security_group_ids

}

module "ec2_web2" {
  source             = "../ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  environment        = var.environment
  subnet_id          = module.vpc.subnet2_id
  security_group_ids = module.vpc.security_group_ids

}

module "ec2_web3" {
  source             = "../ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  environment        = var.environment
  subnet_id          = module.vpc.subnet3_id
  security_group_ids = module.vpc.security_group_ids
}











// Additional resources can be added here, such as load balancers, auto-scaling groups, etc.
// for for ec2 module to call it once and loop over subnets
// create a ec2 in private subnet
// add user data
// readable documentation
