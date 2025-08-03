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
  # subnet1_cidr       = var.subnet1_cidr
  # subnet2_cidr       = var.subnet2_cidr
  # subnet3_cidr       = var.subnet3_cidr
  # availability_zone1 = var.availability_zone1
  # availability_zone2 = var.availability_zone2
  # availability_zone3 = var.availability_zone3

}

// Call the EC2 module to create an EC2 instance (assuming the module is defined in ../ec2)

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












// elastic ip, function, place ec2 in private subnet, add user data script for wordpress, maybe separate modules for load balancer, asg, 
