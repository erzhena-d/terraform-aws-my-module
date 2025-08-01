provider "aws" {
  region = "us-east-2" # Ohio region
}

module "vpc" {
  source       = "../vpc"
  vpc_cidr     = var.vpc_cidr
  subnet1_cidr = var.subnet1_cidr
  environment  = var.environment
  region       = "us-east-2"
}

module "ec2" {
  source        = "../ec2"
  ami_id        = "ami-08ca1d1e465fbfe0c"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.subnet
  region        = var.region
}
