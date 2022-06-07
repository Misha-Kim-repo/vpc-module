resource "aws_eip" "eip_nat_2a" {
    vpc = true

    lifecycle {
     create_before_destroy = true 
    }
}

resource "aws_eip" "eip_nat_2c" {
    vpc = true
    
    lifecycle {
      create_before_destroy = true
    }
}

resource "aws_nat_gateway" "nat_2a" {
    allocation_id = aws_eip.eip_nat_2a.id

    subnet_id = aws_subnet.public-2a.id

    tags = {
        Name = "for-TEST-NAT-2a"
    }
}

resource "aws_nat_gateway" "nat_2c" {
    allocation_id = aws_eip.eip_nat_2c.id

    subnet_id = aws_subnet.public-2c.id

    tags = {
        Name = "for-TEST-NAT-2c"
    }
}

