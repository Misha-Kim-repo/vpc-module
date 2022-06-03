resource "aws_subnet" "AZ-2a" {
    vpc_id = aws_vpc.this.vpc_id

    availability_zone = "ap-northeast-2a"
    cidr_block = "94.0.0.0/24"
}

resource "aws_subnet" "AZ-2c" {
    vpc_id = aws_vpc.this.vpc_id

    availability_zone = "ap-northeast-2c"
    cidr_block = "94.0.1.0/24"
}