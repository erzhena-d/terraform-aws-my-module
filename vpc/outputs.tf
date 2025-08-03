output "vpc_id" {
  value = aws_vpc.kaizen.id
}

# output "subnet_ids" {
#   value = [
#     aws_subnet.subnet1.id,
#     aws_subnet.subnet2.id,
#     aws_subnet.subnet3.id
#   ]
# }

# output "security_group_ids" {
#   value = aws_security_group.allow_tls.id
# }

# output "subnet1_id" {
# value = aws_subnet.subnet1.id
# }

# output "subnet2_id" {
# value = aws_subnet.subnet2.id
# }

# output "subnet3_id" {
# value = aws_subnet.subnet3.id
# }

output "security_group_ids" {
  value = [aws_security_group.allow_tls.id]
}
output "subnet1_id" {
  value = aws_subnet.public["subnet-public-a"].id
}

output "subnet2_id" {
  value = aws_subnet.public["subnet-public-b"].id
}

output "subnet3_id" {
  value = aws_subnet.public["subnet-public-c"].id
}

output "subnet_ids" {
  value = [for s in aws_subnet.public : s.id]
}
