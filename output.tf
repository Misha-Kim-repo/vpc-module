output "vpc_name" {
    value = aws_vpc.this.tags
}

output "vpc_cidr_range" {
    value = aws_vpc.this.cidr_block
}

output "subnet_cidr_range-pub-2a" {
    value = aws_subnet.public-2a.cidr_block
}

output "subnet_cidr_range-pub-2c" {
    value = aws_subnet.public-2c.cidr_block
}

output "subnet_cidr_range-web-2a" {
    value = aws_subnet.private-2a-web.cidr_block
}

output "subnet_cidr_range-web-2c" {
    value = aws_subnet.private-2c-web.cidr_block
}

output "subnet_cidr_range-was-2a" {
    value = aws_subnet.private-2a-was.cidr_block
}

output "subnet_cidr_range-was-2c" {
    value = aws_subnet.private-2c-was.cidr_block
}

output "subnet_cidr_range-db-2a" {
    value = aws_subnet.private-2a-db.cidr_block
}

output "subnet_cidr_range-db-2c" {
    value = aws_subnet.private-2c-db.cidr_block
}