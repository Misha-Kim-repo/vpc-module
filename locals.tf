locals {
    ####NAMING PREFIX####
    prefix = "for-TEST"
}

locals {
    network_subnets = flatten([
        for key, value in var.subnets : {
            purpose = key
            cidr    = value
        }
    ])
}

# locals {
#     public_subnets = flatten([
#         for key, value in local.network_subnets : {
#             key      = purpose
#             value    = cidr
#         } if "public" == local.network_subnets[*].purpose[*]
#     ])
# }

# locals {
#     private_subnets = flatten([
#         for key, value in var.subnets : {
#             purpose = key
#             cidr    = value
#         } if ["public"] != local.network_subnets[*].purpose[*]
#     ])
# }





