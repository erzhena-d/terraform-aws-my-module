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
  description = "List of subnets with name, CIDR, and availability zone"
  type = list(object({
    name = string
    cidr = string
    az   = string
  }))
}




