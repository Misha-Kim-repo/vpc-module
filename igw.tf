resource "aws_internet_gateway" "this" {
    vpc_id = aws_vpc.this.id

    tags = {
        Name = format("IGW-TEST-%s", formatdate("YYYY-MM-DD", timestamp()))
    }
}