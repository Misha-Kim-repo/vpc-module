resource "aws_vpc" "this" {
    cidr_block = var.vpc_cidr

    #locals.tf에서 생성한 Naming 용 prefix 작성 후 사용
    tags = {
        Name = format("${local.prefix}-VPC-%s", formatdate("YYYY-MM-DD", timestamp()))
    }
}

################################################Internet Gateway################################################
resource "aws_internet_gateway" "this" {
    # IGW를 생성하기 전 vpc_id를 할당하기 위해 추가 코드 작성
    # vpc_id를 할당하기 전 IGW의 사용 여부 판단을 통해 IGW를 생성한다.
    vpc_id = "true" == var.enable_internet_gateway ? aws_vpc.this.id : "" 

    #locals.tf에서 생성한 Naming 용 prefix 작성 후 사용
    tags = {
        Name = format("${ local.prefix }-IGW-%s", formatdate("YYYY-MM-DD", timestamp()))
    }
}

################################################NAT Gateway################################################

# 신 EIP 생성 리소스
# NAT를 위해 EIP를 선행으로 생성
# IGW 생성이 선행되어야 하며, NAT Gateway의 enable 여부는 availability zone의 개수가 1개 이상일 때 true로 변경
resource "aws_eip" "nat_eip" {
    vpc = true
    count = "${ "true" == var.enable_nat_gateway && "true" == var.enable_internet_gateway ? length(var.availability_zone) : 0 }"

    #locals.tf에서 생성한 Naming 용 prefix 작성 후 사용
    tags = {
        Name = format( "${ local.prefix }-EIP-for-NAT-%s", formatdate( "YYYY-MM-DD", timestamp() ) )
    }
}

#220609_추가
#Terraform에서 사용 중인 자료구조에 대한 이해가 부족하여 dynamic 형태의 subnet 작성이 불가하여 NAT 및 RT에 대한 작성이 불가능
#subnet에 작성이 되었을 것을 전제로 NAT가 작성될 로직을 아래에 작성
    #for_each를 통해 작성된 AZ만큼의 NAT를 동적 생성할 수 있도록 값을 저장
    #allocation_id에 위에서 작성한 NAT용도의 IP를 subnet 인덱스를 가져오는 것으로 각 셋트에 맞게 할당
    #subnet_id는 
resource "aws_nat_gateway" "this" {
    for_each = local.public_subnets
    allocation_id = aws_eip.nat_eip[index(local.public_subnets, each.value)]
    subnet_id     = aws_subnet.this[each.value].id 
}


# 구 EIP 생성 리소스
# resource "aws_eip" "eip_nat_2a" {
#     vpc = true

#     lifecycle {
#      create_before_destroy = true 
#     }
# }

# resource "aws_eip" "eip_nat_2c" {
#     vpc = true
    
#     lifecycle {
#       create_before_destroy = true
#     }
# }

# 구 NAT 생성 리소스
# resource "aws_nat_gateway" "nat_2a" {
#     allocation_id = aws_eip.eip_nat_2a.id

#     subnet_id = aws_subnet.public-2a.id

#     tags = {
#         Name = "${locals.prefix}-NAT-"
#     }
# }

# resource "aws_nat_gateway" "nat_2c" {
#     allocation_id = aws_eip.eip_nat_2c.id

#     subnet_id = aws_subnet.public-2c.id

#     tags = {
#         Name = "for-TEST-NAT-2c"
#     }
# }
