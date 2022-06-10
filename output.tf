# 신 output
##########################VPC##########################
output "vpc_name" {
    value = aws_vpc.this.tags
}

output "vpc_cidr" {
    value = aws_vpc.this.cidr_block
}

# output "test" {
#     value = var.subnets.public[0]
# }

output "test2" {
    value = local.network_subnets
}

# output "test3" {
#     value = local.public_subnets
# }

# output "test4" {
#     value = local.private_subnets
# }

output "test3" {
    value = local.network_subnets[*].purpose[*]
}

output "test4" {
    value = local.network_subnets[*].cidr[0]
}

output "test5" {
    value = local.network_subnets[*].cidr[1]
}



##########################SUBNET##########################
 
# 구 output
# output "vpc_name" {
#     value = aws_vpc.this.tags
# }

# output "vpc_cidr_range" {
#     value = aws_vpc.this.cidr_block
# }

# output "subnet_cidr_range-pub-2a" {
#     value = aws_subnet.public-2a.cidr_block
# }

# output "subnet_cidr_range-pub-2c" {
#     value = aws_subnet.public-2c.cidr_block
# }

# output "subnet_cidr_range-web-2a" {
#     value = aws_subnet.private-2a-web.cidr_block
# }

# output "subnet_cidr_range-web-2c" {
#     value = aws_subnet.private-2c-web.cidr_block
# }

# output "subnet_cidr_range-was-2a" {
#     value = aws_subnet.private-2a-was.cidr_block
# }

# output "subnet_cidr_range-was-2c" {
#     value = aws_subnet.private-2c-was.cidr_block
# }

# output "subnet_cidr_range-db-2a" {
#     value = aws_subnet.private-2a-db.cidr_block
# }

# output "subnet_cidr_range-db-2c" {
#     value = aws_subnet.private-2c-db.cidr_block
# }