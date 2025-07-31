# terraform-module
homework25

```
module "my-module" {
source  = "erzhena-d/my-module/aws"
version = "1.0.0"
vpc_cidr           = "10.0.0.0/16"
subnet1_cidr       = "10.0.1.0/24"
subnet2_cidr       = "10.0.2.0/24"
subnet3_cidr       = "10.0.3.0/24"
availability_zone1 = "us-east-2a"
availability_zone2 = "us-east-2b"
availability_zone3 = "us-east-2c"
}

```