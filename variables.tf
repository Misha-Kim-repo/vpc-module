variable "vpc_cidr" {
    description = "Test for Terraform-3-tier VPC cidr blocks"
    type        = string
}

variable "subnet_pub_cidr-2a" {
    description = "Test for Terraform-3-tier Subnet cidr blocks (public-2a)"
    type        = string
}

variable "subnet_pub_cidr-2c" {
    description = "Test for Terraform-3-tier Subnet cidr blocks (public-2c)"
    type        = string
}

variable "subnet_pri_cidr-web-2a" {
    description = "Test for Terraform-3-tier WEB Subnet cidr blocks (private-2a)"
    type        = string
}

variable "subnet_pri_cidr-web-2c" {
    description = "Test for Terraform-3-tier WEB Subnet cidr blocks (private-2c)"
    type        = string
}

variable "subnet_pri_cidr-was-2a" {
    description = "Test for Terraform-3-tier WAS Subnet cidr blocks (private-2a)"
    type        = string
}

variable "subnet_pri_cidr-was-2c" {
    description = "Test for Terraform-3-tier WAS Subnet cidr blocks (private-2c)"
    type        = string
}

variable "subnet_pri_cidr-db-2a" {
    description = "Test for Terraform-3-tier DB Subnet cidr blocks (private-2a)"
    type        = string
}

variable "subnet_pri_cidr-db-2c" {
    description = "Test for Terraform-3-tier DB Subnet cidr blocks (private-2c)"
    type        = string
}




