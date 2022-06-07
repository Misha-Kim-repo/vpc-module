##########################################################PUBLIC##########################################################
resource "aws_route_table" "route_table_for_public" {
    vpc_id = aws_vpc.this.id

    tags = {
        Name = format("ROUTE-TABLE-TEST-PUB-%s", formatdate("YYYY-MM-DD", timestamp()))
    }
}

resource "aws_route_table_association" "route_table_association_2a" {
    subnet_id = aws_subnet.public-2a.id
    route_table_id = aws_route_table.route_table_for_public.id
}

resource "aws_route_table_association" "route_table_association_2c" {
    subnet_id = aws_subnet.public-2c.id
    route_table_id = aws_route_table.route_table_for_public.id
}

resource "aws_route" "route_pub" {
    route_table_id = aws_route_table.route_table_for_public.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
}

##########################################################PRIVATE##########################################################
resource "aws_route_table" "route_table_for_private-2a" {
    vpc_id = aws_vpc.this.id

    tags = {
        Name = format("ROUTE-TABLE-TEST-PRI-2a-%s", formatdate("YYYY-MM-DD", timestamp()))
    }
}

resource "aws_route_table" "route_table_for_private-2c" {
    vpc_id = aws_vpc.this.id

    tags = {
        Name = format("ROUTE-TABLE-TEST-PRI-2c-%s", formatdate("YYYY-MM-DD", timestamp()))
    }
}

resource "aws_route_table_association" "route_table_association_web-2a" {
    subnet_id = aws_subnet.private-2a-web.id
    route_table_id = aws_route_table.route_table_for_private-2a.id
}

resource "aws_route_table_association" "route_table_association_web-2c" {
    subnet_id = aws_subnet.private-2c-web.id
    route_table_id = aws_route_table.route_table_for_private-2c.id
}

resource "aws_route_table_association" "route_table_association_was-2a" {
    subnet_id = aws_subnet.private-2a-was.id
    route_table_id = aws_route_table.route_table_for_private-2a.id
}

resource "aws_route_table_association" "route_table_association_was-2c" {
    subnet_id = aws_subnet.private-2c-was.id
    route_table_id = aws_route_table.route_table_for_private-2c.id
}

resource "aws_route_table_association" "route_table_association_db-2a" {
    subnet_id = aws_subnet.private-2a-db.id
    route_table_id = aws_route_table.route_table_for_private-2a.id
}

resource "aws_route_table_association" "route_table_association_db-2c" {
    subnet_id = aws_subnet.private-2c-db.id
    route_table_id = aws_route_table.route_table_for_private-2c.id
}

resource "aws_route" "route_nat_2a" {
    route_table_id = aws_route_table.route_table_for_private-2a.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_2a.id
}

resource "aws_route" "route_nat_2c" {
    route_table_id = aws_route_table.route_table_for_private-2c.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_2c.id
}