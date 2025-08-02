resource "aws_instance" "web2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.bastion_key.key_name
  subnet_id              = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id]
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = "${var.environment}-web2"
  }
}



