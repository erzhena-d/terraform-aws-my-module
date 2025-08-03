## terraform-module
homework25

```hcl
module "my-module" {
source  = "erzhena-d/my-module/aws"
version = "3.0.0"
}

{
environment = "dev"
vpc_cidr    = "10.0.0.0/16"

subnets = [
  {
    name = "subnet-public-a"
    cidr = "10.0.1.0/24"
    az   = "us-east-2a"
  },
  {
    name = "subnet-public-b"
    cidr = "10.0.2.0/24"
    az   = "us-east-2b"
  },
  {
    name = "subnet-public-c"
    cidr = "10.0.3.0/24"
    az   = "us-east-2c"
  }
]

instance_type = "t2.micro"
ami_id        = "ami-08ca1d1e465fbfe0c"
}

```