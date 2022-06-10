# 신 subnet 생성 리소스. dynamic 구성
# 변상기 매니저님 repo 참고
# vpc_id = 먼저 생성했던 vpc의 id 참조
# variables에서 입력받은 subnet 대역 및 사용 용도에 대한 구조(map)를 for_each로 구성하여 key/value로 나눔
# varaibles에서 입력받은 key/value를 통해 subnet map에서 index 값을 반환하여 subnet 용의 가용 구역 구성

#220609_추가
#해당 내역 Terraform에서 쓰이는 자료구조에 대한 학습이 부족한 관계로 돌지 않을 가능성이 매우 높음
#기존에 subnet 대역을 variables에서 받을 떄 map(any)에 대한 학습이 부족하여 원하는 값을 추출할 정도가 되지 않음
#실행이 되지 않는다는 것을 가정으로 상정하고 생각했던 로직
    #variable에서 입력받은 subnet 대역의 값을 locals의 network_subnet 변수를 통해 flatten 함수를 통하여 key/value 형식으로 원하는 값을 불러올 수 있게하는 자료구조 형을 가지게 됌
    #위에서 저장한 local.network_subnet의 값을 for-each로 저장하여 동적으로 원하는 값들에 대해서만 여러 리소스를 생성할 수 있게끔 코드 작성
    #cidr_block에는 for-each에서 저장한 cidr 대역을 저장
    #availability_zone에는 local.network_subnet의 각 인덱스값을 통해 variables로 전달받은 가용구역과 조합하여 AZ를 작성
resource "aws_subnet" "this" {
    vpc_id = aws_vpc.this.id
    for_each = { for cidr in local.network_subnets : cidr => local.network_subnets[*].cidr[*]}
    cidr_block = each.value.cidr
    availability_zone = var.availability_zone[index(local.network_subnets[*].cidr[*], each.value.cidr)]
    # cidr_block = local.public_subnets
      
    tags = {
        Name = format( "${ local.prefix }-SUBNET-%s", formatdate( "YYYY-MM-DD", timestamp() ) )
    }
}

# 구 subnet 생성 리소스
# resource "aws_subnet" "public-2a" {
#     vpc_id = aws_vpc.this.id
#     cidr_block = var.subnet_pub_cidr-2a
#     availability_zone = "ap-northeast-2a"

#     tags = {
#         Name = format("SUBNET-PUB-2a-%s", formatdate("YYYY-MM-DD", timestamp()))
#     }
# }

# resource "aws_subnet" "public-2c" {
#     vpc_id = aws_vpc.this.id
#     cidr_block = var.subnet_pub_cidr-2c
#     availability_zone = "ap-northeast-2c"

#     tags = {
#         Name = format("SUBNET-PUB-2c-%s", formatdate("YYYY-MM-DD", timestamp()))
#     }
# }

# resource "aws_subnet" "private-2a-web" {
#     vpc_id = aws_vpc.this.id
#     cidr_block = var.subnet_pri_cidr-web-2a
#     availability_zone = "ap-northeast-2a"

#     tags = {
#         Name = format("SUBNET-PRI-WEB-2a-%s", formatdate("YYYY-MM-DD", timestamp()))
#     }
# }

# resource "aws_subnet" "private-2c-web" {
#     vpc_id = aws_vpc.this.id
#     cidr_block = var.subnet_pri_cidr-web-2c
#     availability_zone = "ap-northeast-2c"

#     tags = {
#         Name = format("SUBNET-PRI-WEB-2c-%s", formatdate("YYYY-MM-DD", timestamp()))
#     }
# }

# resource "aws_subnet" "private-2a-was" {
#     vpc_id = aws_vpc.this.id
#     cidr_block = var.subnet_pri_cidr-was-2a
#     availability_zone = "ap-northeast-2a"

#     tags = {
#         Name = format("SUBNET-PRI-WAS-2a-%s", formatdate("YYYY-MM-DD", timestamp()))
#     }
# }

# resource "aws_subnet" "private-2c-was" {
#     vpc_id = aws_vpc.this.id
#     cidr_block = var.subnet_pri_cidr-was-2c
#     availability_zone = "ap-northeast-2c"

#     tags = {
#         Name = format("SUBNET-PRI-WAS-2c-%s", formatdate("YYYY-MM-DD", timestamp()))
#     }
# }

# resource "aws_subnet" "private-2a-db" {
#     vpc_id = aws_vpc.this.id
#     cidr_block = var.subnet_pri_cidr-db-2a
#     availability_zone = "ap-northeast-2a"

#     tags = {
#         Name = format("SUBNET-PRI-DB-2a-%s", formatdate("YYYY-MM-DD", timestamp()))
#     }
# }

# resource "aws_subnet" "private-2c-db" {
#     vpc_id = aws_vpc.this.id
#     cidr_block = var.subnet_pri_cidr-db-2c
#     availability_zone = "ap-northeast-2c"

#     tags = {
#         Name = format("SUBNET-PRI-DB-2c-%s", formatdate("YYYY-MM-DD", timestamp()))
#     }
# }