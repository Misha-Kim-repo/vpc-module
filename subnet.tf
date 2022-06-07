resource "aws_subnet" "public-2a" {
    vpc_id = aws_vpc.this.id
    cidr_block = var.subnet_pub_cidr-2a
    availability_zone = "ap-northeast-2a"

    tags = {
        Name = format("SUBNET-PUB-2a-%s", formatdate("YYYY-MM-DD", timestamp()))
    }
}

resource "aws_subnet" "public-2c" {
    vpc_id = aws_vpc.this.id
    cidr_block = var.subnet_pub_cidr-2c
    availability_zone = "ap-northeast-2c"

    tags = {
        Name = format("SUBNET-PUB-2c-%s", formatdate("YYYY-MM-DD", timestamp()))
    }
}

resource "aws_subnet" "private-2a-web" {
    vpc_id = aws_vpc.this.id
    cidr_block = var.subnet_pri_cidr-web-2a
    availability_zone = "ap-northeast-2a"

    tags = {
        Name = format("SUBNET-PRI-WEB-2a-%s", formatdate("YYYY-MM-DD", timestamp()))
    }
}

resource "aws_subnet" "private-2c-web" {
    vpc_id = aws_vpc.this.id
    cidr_block = var.subnet_pri_cidr-web-2c
    availability_zone = "ap-northeast-2c"

    tags = {
        Name = format("SUBNET-PRI-WEB-2c-%s", formatdate("YYYY-MM-DD", timestamp()))
    }
}

resource "aws_subnet" "private-2a-was" {
    vpc_id = aws_vpc.this.id
    cidr_block = var.subnet_pri_cidr-was-2a
    availability_zone = "ap-northeast-2a"

    tags = {
        Name = format("SUBNET-PRI-WAS-2a-%s", formatdate("YYYY-MM-DD", timestamp()))
    }
}

resource "aws_subnet" "private-2c-was" {
    vpc_id = aws_vpc.this.id
    cidr_block = var.subnet_pri_cidr-was-2c
    availability_zone = "ap-northeast-2c"

    tags = {
        Name = format("SUBNET-PRI-WAS-2c-%s", formatdate("YYYY-MM-DD", timestamp()))
    }
}

resource "aws_subnet" "private-2a-db" {
    vpc_id = aws_vpc.this.id
    cidr_block = var.subnet_pri_cidr-db-2a
    availability_zone = "ap-northeast-2a"

    tags = {
        Name = format("SUBNET-PRI-DB-2a-%s", formatdate("YYYY-MM-DD", timestamp()))
    }
}

resource "aws_subnet" "private-2c-db" {
    vpc_id = aws_vpc.this.id
    cidr_block = var.subnet_pri_cidr-db-2c
    availability_zone = "ap-northeast-2c"

    tags = {
        Name = format("SUBNET-PRI-DB-2c-%s", formatdate("YYYY-MM-DD", timestamp()))
    }
}