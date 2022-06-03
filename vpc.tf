resource "aws_vpc" "this" {
    cidr_block = var.vpc_cidr

    tags  = {
        Name = format("%s-%s", "${var.vpc_name}", formatdate("YYYY-MM-DD", timestamp()))
    }
}