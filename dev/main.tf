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
  region = var.aws_region
}

// Call the VPC module to create a VPC and subnets
module "vpc" {
  source = "../vpc"

  vpc_cidr     = var.vpc_cidr
  vpc_azs      = var.availability_zone1
  subnet_cidrs = var.subnet_cidrs
  environment  = var.environment
}

// Call the EC2 module to create an EC2 instance (assuming the module is defined in ../ec2)

module "ec2" {
  source         = "../ec2"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  key_name       = var.key_name
  environment    = var.environment
  instance_count = var.instance_count


  subnet_id = module.vpc.public_subnet_ids[0]

  security_groups = module.vpc.security_group_ids
}











// elastic ip, function, place ec2 in private subnet, add user data script for wordpress, maybe separate modules for load balancer, asg, 
