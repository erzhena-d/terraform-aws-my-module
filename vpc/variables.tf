// Here we declare variables and describe their types and descriptions

variable "environment" {
  description = "The environment for deployment"
  type        = string
  default     = "dev"
}
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnets" {
  type = list(object({
    name = string
    cidr = string
    az   = string
  }))
  description = "List of subnets with name, CIDR, and availability zone"
}
# variable "subnet1_cidr" {
#   description = "CIDR block for subnet 1"
#   type        = string
#   default     = "10.0.1.0/24"
# }
# variable "subnet2_cidr" {
#   description = "CIDR block for subnet 2"
#   type        = string
#   default     = "10.0.2.0/24"
# }
# variable "subnet3_cidr" {
#   description = "CIDR block for subnet 3"
#   type        = string
#   default     = "10.0.3.0/24"
# }

# variable "availability_zone1" {
#   description = "The availability zone to deploy subnet 1 in"
#   type        = string
#   default     = "us-east-2a"
# }
# variable "availability_zone2" {
#   description = "The availability zone to deploy subnet 2 in"
#   type        = string
#   default     = "us-east-2b"
# }
# variable "availability_zone3" {
#   description = "The availability zone to deploy subnet 3 in"
#   type        = string
#   default     = "us-east-2c"
# }

