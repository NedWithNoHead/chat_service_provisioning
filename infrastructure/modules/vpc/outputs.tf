output "subnet1_id" {
    value = aws_subnet.subnet1.id
}

output "subnet2_id" {
  value = aws_subnet.subnet2.id
}

output "pubic_security_group" {
  value = aws_security_group.public
}

output "private_security_group" {
  value = aws_security_group.private
}

output "vpc_id" {
  value = aws_vpc.main.id
}

