output "vpc_name" {
    value = aws_vpc.this.tags
}

output "vpc_cidr" {
    value = aws_vpc.this.cidr_block
}

output "igw_name" {
    value = aws_internet_gateway.this.tags
}