output "vpc_id" {
  value = aws_vpc.kaizen.id
}

output "subnet_ids" {
  value = [
    aws_subnet.subnet1.id,
    aws_subnet.subnet2.id,
    aws_subnet.subnet3.id
  ]
}

output "security_group_id" {
  value = aws_security_group.allow_tls.id
}
