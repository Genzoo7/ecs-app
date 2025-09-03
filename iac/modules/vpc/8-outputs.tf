output "vpc_id" {
  value = aws_vpc.this.id
}
# it can be as input to other modules

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "alb_dns_name" {
  value = aws_lb.this.dns_name
}