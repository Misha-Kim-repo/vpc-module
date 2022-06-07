resource "aws_vpc" "this" {
    cidr_block = var.vpc_cidr

    tags = {
        Name = format("VPC-TEST-%s", formatdate("YYYY-MM-DD", timestamp()))
    }
}
