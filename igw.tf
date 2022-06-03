resource "aws_internet_gateway" "this" {
    vpc_id = aws_vpc.this.vpc_id

    tags = {
        Name = format("%s-%s", "${var.igw_name}", formatdate("YYYY-MM-DD", timestamp()))
    }
}