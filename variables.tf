variable "vpc_cidr" {
    description = "생성할 VPC cidr blocks"
    type        = string
    #default     ="94.0.0.0/16"
}

variable "enable_internet_gateway" {
    description = "IGW 사용 여부. default로 false 값을 가지며, IGW 생성 시 먼저 생성된 VPC ID의 확인을 통해 해당 값이 true로 변경되며 IGW를 생성하게 된다"
    type        = string
    default     = "false"
}

variable "enable_nat_gateway" {
    description = "NAT 사용 여부. default로 false 값을 가지며, NAT의 경우, IGW 생성이 선행되어야 하며, AZ의 갯수가 선택되었을 때 비로소 true가 되어 NAT를 AZ 당 하나씩 생성"
    type        = string
    default     = "false"
}

# 예시 : ["ap-northeast-2a", "ap-northeast-2c"]
variable "availability_zone" {
    description = "사용할 가용 구역 입력"
    type        = list 
    #default     =  ["ap-northeast-2a", "ap-northeast-2c"]
}

# any(map(any))의 경우, terraform에서 제공하는 동적(dynamic)유형의 변수로써, 타입이 아직 정해지지 않은 상태를 의미
# 변상기M님 github VPC 리소스 참고
#    subnets { 
    #   (each.key)          (each.value(list))    
    #   "public"  = ["94.0.0.0/24", "94.0.1.0/24"],
    #    "web"    = ["94.0.2.0/24", "94.0.3.0/24"],
    #    "was"    = ["94.0.4.0/24", "94.0.5.0/24"],
    #    "db"     = ["94.0.6.0/24", "94.0.7.0/24"]
#   }
# { "public" = ["94.0.0.0/24", "94.0.1.0/24"], "web" = ["94.0.2.0/24", "94.0.3.0/24"] }
variable "subnets" {
    description = "사용자로부터 map 형태의 subnet을 지정받음. key 값이 public인 경우를 제외하고 나머지 전부 private로 생성"
    type        = map(any)
}




