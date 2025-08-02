variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "subnet1_cidr" {
  type = string
}

variable "subnet2_cidr" {
  type = string
}

variable "subnet3_cidr" {
  type = string
}

variable "availability_zone1" {
  type    = string
  default = "us-east-2a"
}

variable "availability_zone2" {
  type    = string
  default = "us-east-2b"
}

variable "availability_zone3" {
  type    = string
  default = "us-east-2c"
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  type = string
}

