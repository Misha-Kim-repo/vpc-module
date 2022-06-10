#220610_추가
#Terraform 코드의 자료구조 학습이 부족하여 subnet 구성이 덜 된 관계로 더불어 NAT 및 RT 등에 대한 작성 진행 불가
#해당 주석에서는 subnet이 작성된 이후 RT 구성에 대한 부분을 작성
    #public 및 private 대역을 위한 각각의 RT를 하나씩 구성
    #subnet.tf 파일에서 구성했던 서브넷 대역을 private/public 대역으로 나눠서 map 형태의 변수에 저장
    #저장한 내역을 바탕으로 public/private association을 각각 작성하여 for-each에 할당 후 해당 서브넷 숫자에 맞게 association 진행
    #IGW Route : 작성된 Route Table 및 IGW Id를 적절히 분배하여 할당
    #NAT Route : Private 대역에 대한 Route Table을 동적으로 변수에 저장하여 AZ의 갯수만큼 NAT 및 각각의 Routing대역을 할당
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